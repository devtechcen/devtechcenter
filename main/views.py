from django.shortcuts import render, redirect, get_object_or_404
from .forms import CustomUserCreationForm, SubmissionForm, FeedbackForm
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from .models import Submission


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
