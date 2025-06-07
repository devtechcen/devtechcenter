from django.shortcuts import render, redirect, get_object_or_404
from .forms import CustomUserCreationForm, SubmissionForm, FeedbackForm
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import Submission
from django.utils import timezone
from django.contrib.auth.models import User


# Create your views here.


def main(request):
    return render(request, "main.html")


def about(request):
    return render(request, "about.html")


def contacts(request):
    return render(request, "contacts.html")


def faq(request):
    return render(request, "faq.html")


def feedback_thanks(request):
    return render(request, "feedback_thanks.html")


def register_view(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("main")
    else:
        form = CustomUserCreationForm()
    return render(request, "register.html", {"form": form})


@login_required(login_url="register")
def create_submission_view(request):
    if request.method == "POST":
        form = SubmissionForm(request.POST)
        if form.is_valid():
            submission = form.save(commit=False)
            submission.employee = None
            submission.processed_at = None
            submission.user = request.user
            submission.save()

            return redirect("main")
    else:
        form = SubmissionForm()
    return render(request, "create_submission.html", {"form": form})


def feedback_view(request):
    if request.method == "POST":
        form = FeedbackForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("feedback_thanks")
    else:
        form = FeedbackForm()

    return render(request, "feedback.html", {"form": form})


@login_required
def profile_view(request):
    submissions = Submission.objects.filter(user=request.user).order_by(
        "-submission_date"
    )
    return render(request, "profile.html", {"submissions": submissions})


@login_required
def edit_submission_view(request, submission_id):
    submission = get_object_or_404(Submission, id=submission_id, user=request.user)

    if request.method == "POST":
        form = SubmissionForm(request.POST, instance=submission)
        if form.is_valid():
            form.save()
            return redirect("profile")
    else:
        form = SubmissionForm(instance=submission)

    return render(request, "edit_submission.html", {"form": form})


@login_required
def delete_submission_view(request, submission_id):
    submission = get_object_or_404(Submission, id=submission_id, user=request.user)

    if request.method == "POST":
        submission.delete()
        return redirect("profile")

    return render(request, "confirm_delete.html", {"submission": submission})


@login_required
def manager_panel(request):
    if request.user.userprofile.role != "manager":
        return redirect("main")

    submissions = Submission.objects.filter(employee=request.user)
    return render(request, "manager_panel.html", {"submissions": submissions})


@login_required
def manager_submission_detail(request, submission_id):
    submission = get_object_or_404(Submission, pk=submission_id)

    field_labels = {
        "name": Submission._meta.get_field("name").verbose_name,
        "email": Submission._meta.get_field("email").verbose_name,
        "category": Submission._meta.get_field("category").verbose_name,
        "description": Submission._meta.get_field("description").verbose_name,
        "status": Submission._meta.get_field("status").verbose_name,
        "submission_date": Submission._meta.get_field("submission_date").verbose_name,
        "processed_at": Submission._meta.get_field("processed_at").verbose_name,
    }

    return render(
        request,
        "manager_submission_detail.html",
        {
            "submission": submission,
            "field_labels": field_labels,
        },
    )


def is_admin(user):
    return user.is_authenticated and user.userprofile.role == "admin"


@user_passes_test(is_admin, login_url="login")
def admin_panel_view(request):
    managers = User.objects.filter(userprofile__role="manager")
    selected_manager_id = request.GET.get("manager")

    submissions = (
        Submission.objects.select_related("employee", "user")
        .all()
        .order_by("-submission_date")
    )

    if selected_manager_id:
        if selected_manager_id == "none":
            submissions = submissions.filter(employee__isnull=True)
        else:
            submissions = submissions.filter(employee_id=selected_manager_id)

    return render(
        request,
        "admin_panel.html",
        {
            "submissions": submissions,
            "managers": managers,
            "selected_manager_id": selected_manager_id,
        },
    )


@user_passes_test(is_admin, login_url="login")
def admin_submission_detail_view(request, submission_id):
    submission = get_object_or_404(Submission, id=submission_id)
    managers = User.objects.filter(userprofile__role="manager")

    if request.method == "POST":
        manager_id = request.POST.get("manager")
        manager = get_object_or_404(User, id=manager_id)
        submission.employee = manager
        submission.status = "рассматривается"
        submission.save()
        return redirect("admin_panel_view")

    return render(
        request,
        "admin_submission_detail.html",
        {"submission": submission, "managers": managers},
    )


@login_required
def mark_as_processed(request, submission_id):
    submission = get_object_or_404(Submission, pk=submission_id)
    submission.status = "обработана"
    submission.processed_at = timezone.now()
    submission.save()
    return redirect("manager_panel")
