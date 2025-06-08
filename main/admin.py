from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Feedback, UserProfile

admin.site.register(UserProfile)


@admin.register(Feedback)
class FeedbackAdmin(admin.ModelAdmin):
    list_display = ("name", "email", "phone", "status", "submission_date")
    list_filter = ("status",)
    search_fields = ("name", "email", "description")
