from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.db.models.signals import post_save
from django.dispatch import receiver


class UserProfile(models.Model):
    ROLE_CHOICES = [
        ("user", "Пользователь"),
        ("manager", "Менеджер"),
        ("admin", "Администратор"),
    ]

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default="user")

    def __str__(self):
        return f"{self.user.username} ({self.get_role_display()})"


class Submission(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="submitted_submissions"
    )
    employee = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="processed_submissions",
    )

    name = models.CharField(max_length=100)
    email = models.EmailField()
    category = models.CharField(
        max_length=100, choices=[("A", "Категория А"), ("B", "Категория B")]
    )
    description = models.TextField()
    submission_date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(
        max_length=20,
        choices=[
            ("не рассмотрено", "Не рассмотрено"),
            ("рассматривается", "Рассматривается"),
            ("рассмотрено", "Рассмотрено"),
        ],
        default="не рассмотрено",
    )
    processed_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.name


class Feedback(models.Model):
    STATUS_CHOICES = [
        ("не рассмотрено", "Не рассмотрено"),
        ("рассматривается", "Рассматривается"),
        ("рассмотрено", "Рассмотрено"),
    ]

    name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    description = models.TextField()
    submission_date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(
        max_length=20, choices=STATUS_CHOICES, default="не рассмотрено"
    )

    def __str__(self):
        return f"{self.name} ({self.status})"


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        from .models import UserProfile

        role = "admin" if instance.is_superuser else "user"
        UserProfile.objects.create(user=instance, role=role)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    if hasattr(instance, "userprofile"):
        instance.userprofile.save()
