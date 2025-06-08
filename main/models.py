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
    assigned_to = models.ForeignKey(
        User, null=True, blank=True, on_delete=models.SET_NULL
    )

    processed_at = models.DateTimeField(null=True, blank=True)

    def save(self, *args, **kwargs):
        if self.pk:
            old = Feedback.objects.get(pk=self.pk)
            if old.status != "рассмотрено" and self.status == "рассмотрено":
                self.processed_at = timezone.now()
        elif self.status == "рассмотрено":
            self.processed_at = timezone.now()

        super().save(*args, **kwargs)

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
