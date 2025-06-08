from django.shortcuts import render, redirect, get_object_or_404
from .forms import CustomUserCreationForm, FeedbackForm
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import Feedback
from django.utils import timezone
from django.contrib.auth.models import User
from django.core.paginator import Paginator


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


def services(request):
    return render(request, "services.html")


def pricing(request):
    return render(request, "pricing.html")


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
    feedbacks = Feedback.objects.filter(email=request.user.email).order_by(
        "-submission_date"
    )
    return render(request, "profile.html", {"feedbacks": feedbacks})


@login_required
def manager_panel(request):
    if request.user.userprofile.role != "manager":
        return redirect("main")

    feedbacks = Feedback.objects.filter(assigned_to=request.user).order_by("status")

    return render(
        request,
        "manager_panel.html",
        {
            "feedbacks": feedbacks,
        },
    )


@login_required
def manager_feedback_detail(request, pk):
    if request.user.userprofile.role != "manager":
        return redirect("main")

    feedback = get_object_or_404(Feedback, pk=pk)

    if request.method == "POST":
        feedback.status = "рассмотрено"
        feedback.save()
        return redirect("manager_panel")

    return render(request, "manager_feedback_detail.html", {"feedback": feedback})


@login_required
def mark_feedback_reviewed(request, feedback_id):
    if request.user.userprofile.role != "manager":
        return redirect("main")

    feedback = get_object_or_404(Feedback, id=feedback_id)
    feedback.status = "рассмотрено"
    feedback.save()
    return redirect("manager_panel")


def is_admin(user):
    return user.is_authenticated and user.userprofile.role == "admin"


@user_passes_test(is_admin, login_url="login")
def admin_panel_view(request):
    managers = User.objects.filter(userprofile__role="manager")
    all_users = User.objects.all()

    selected_manager_id = request.GET.get("manager")

    feedbacks = Feedback.objects.all().order_by("-submission_date")

    if selected_manager_id:
        if selected_manager_id == "none":
            feedbacks = feedbacks.filter(assigned_to__isnull=True)
        else:
            try:
                manager_id_int = int(selected_manager_id)
                feedbacks = feedbacks.filter(assigned_to__id=manager_id_int)
            except ValueError:
                pass

    paginator = Paginator(feedbacks, 10)
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)

    if request.method == "POST":
        selected_user_id = request.POST.get("new_manager")
        if selected_user_id:
            user = get_object_or_404(User, id=selected_user_id)
            profile = user.userprofile
            profile.role = "manager"
            profile.save()
            return redirect("admin_panel_view")

    return render(
        request,
        "admin_panel.html",
        {
            "page_obj": page_obj,
            "managers": managers,
            "all_users": all_users,
            "selected_manager_id": selected_manager_id,
        },
    )


@user_passes_test(is_admin, login_url="login")
def admin_feedback_detail_view(request, feedback_id):
    feedback = get_object_or_404(Feedback, id=feedback_id)
    managers = User.objects.filter(userprofile__role="manager")

    if request.method == "POST":
        manager_id = request.POST.get("manager")
        manager = get_object_or_404(User, id=manager_id)
        feedback.assigned_to = manager
        feedback.status = "рассматривается"
        feedback.save()
        return redirect("admin_panel_view")

    return render(
        request,
        "admin_feedback_detail.html",
        {"feedback": feedback, "managers": managers},
    )


@login_required
def mark_as_processed(request, feedback_id):
    if request.user.userprofile.role != "manager":
        return redirect("main")

    feedback = get_object_or_404(Feedback, pk=feedback_id)
    feedback.status = "рассмотрено"
    feedback.save()
    return redirect("manager_panel")
