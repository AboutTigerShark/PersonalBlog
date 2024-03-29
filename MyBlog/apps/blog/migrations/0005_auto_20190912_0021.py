# Generated by Django 2.0 on 2019-09-11 16:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_auto_20190911_2327'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='desc',
            field=models.CharField(default='', max_length=200, verbose_name='文字简述'),
        ),
        migrations.AlterField(
            model_name='tags',
            name='name',
            field=models.CharField(max_length=30, unique=True, verbose_name='标签名称'),
        ),
    ]
