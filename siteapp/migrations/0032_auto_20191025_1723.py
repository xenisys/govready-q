# Generated by Django 2.2.4 on 2019-10-25 17:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('siteapp', '0031_auto_20190922_1129'),
    ]

    operations = [
        migrations.AlterField(
            model_name='folder',
            name='title',
            field=models.CharField(help_text='The title of this Folder.', max_length=255),
        ),
        migrations.AlterField(
            model_name='invitation',
            name='to_email',
            field=models.CharField(blank=True, help_text='The email address the invitation was sent to, if to a non-existing user.', max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='organization',
            name='name',
            field=models.CharField(help_text='The display name of the Organization.', max_length=255),
        ),
        migrations.AlterField(
            model_name='portfolio',
            name='title',
            field=models.CharField(help_text='The title of this Portfolio.', max_length=255, unique=True),
        ),
    ]
