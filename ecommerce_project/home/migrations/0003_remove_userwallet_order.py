# Generated by Django 4.2.5 on 2023-11-01 11:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_remove_userwallet_product_userwallet_order'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userwallet',
            name='order',
        ),
    ]
