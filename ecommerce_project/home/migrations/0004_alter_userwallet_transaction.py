# Generated by Django 4.2.5 on 2023-11-01 11:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0003_remove_userwallet_order'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userwallet',
            name='transaction',
            field=models.CharField(max_length=50),
        ),
    ]