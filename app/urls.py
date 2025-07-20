"""
URL configuration for app project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path
from main import views
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", views.main, name="main"),
    path("about/", views.about, name="about"),
    path("contacts/", views.contacts, name="contacts"),
    path("faq/", views.faq, name="faq"),
    path("pricing/", views.pricing, name="pricing"),
    path(
        "login/", auth_views.LoginView.as_view(template_name="login.html"), name="login"
    ),
    path("logout/", auth_views.LogoutView.as_view(next_page="/"), name="logout"),
    path("register/", views.register_view, name="register"),
    path("feedback/", views.feedback_view, name="feedback"),
    path("feedback/thanks/", views.feedback_thanks, name="feedback_thanks"),
    path("profile/", views.profile_view, name="profile"),
    path("manager_panel/", views.manager_panel, name="manager_panel"),
    path(
        "manager/feedback/<int:pk>/",
        views.manager_feedback_detail,
        name="manager_feedback_detail",
    ),
    path(
        "mark_feedback_reviewed/<int:feedback_id>/",
        views.mark_feedback_reviewed,
        name="mark_feedback_reviewed",
    ),
    path("admin-panel/", views.admin_panel_view, name="admin_panel_view"),
    path(
        "admin-panel/feedback/<int:feedback_id>/",
        views.admin_feedback_detail_view,
        name="admin_feedback_detail_view",
    ),
    path("admin-panel/stats/download/", views.admin_stats_download, name="admin_stats_download"),
    path("services/", views.services, name="services"),
    path("success-stories/", views.success_stories, name="success_stories"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
