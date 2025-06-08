from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Feedback


class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(
        required=True,
        label="Email",
        widget=forms.EmailInput(attrs={"class": "input", "autocomplete": "email"}),
    )

    class Meta:
        model = User
        fields = ("username", "email", "password1", "password2")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["username"].widget.attrs.update(
            {"class": "input", "autocomplete": "username"}
        )
        self.fields["password1"].widget.attrs.update(
            {"class": "input", "autocomplete": "new-password"}
        )
        self.fields["password2"].widget.attrs.update(
            {"class": "input", "autocomplete": "new-password"}
        )


class FeedbackForm(forms.ModelForm):
    class Meta:
        model = Feedback
        fields = ["name", "email", "phone", "description"]
        labels = {
            "name": "Название",
            "email": "Email",
            "phone": "Телефон",
            "description": "Описание",
        }
        widgets = {
            "name": forms.TextInput(attrs={"class": "input", "required": True}),
            "email": forms.EmailInput(attrs={"class": "input", "required": True}),
            "phone": forms.TextInput(attrs={"class": "input", "required": True}),
            "description": forms.Textarea(
                attrs={"class": "textarea", "required": True, "rows": 4}
            ),
        }
