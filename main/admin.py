from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Submission, Feedback, UserProfile

admin.site.register(UserProfile)


@admin.register(Submission)
class SubmissionAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "name",
        "email",
        "category",
        "status",
        "employee",
        "submission_date",
        "processed_at",
    )
    list_filter = ("status", "category", "employee")
    search_fields = ("name", "email", "description")


@admin.register(Feedback)
class FeedbackAdmin(admin.ModelAdmin):
    list_display = ("name", "email", "phone", "status", "submission_date")
    list_filter = ("status",)
    search_fields = ("name", "email", "description")
