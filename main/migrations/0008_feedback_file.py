from django.db import migrations, models

class Migration(migrations.Migration):
    dependencies = [
        ('main', '0007_feedback_processed_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='feedback',
            name='file',
            field=models.FileField(upload_to='feedback_files/', null=True, blank=True),
        ),
    ] 