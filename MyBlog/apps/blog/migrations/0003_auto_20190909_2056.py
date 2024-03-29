# Generated by Django 2.0 on 2019-09-09 12:56

import DjangoUeditor.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_article_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='content',
            field=DjangoUeditor.models.UEditorField(blank=True, verbose_name='文章内容'),
        ),
        migrations.AlterField(
            model_name='banner',
            name='img',
            field=models.ImageField(upload_to='banner/', verbose_name='图片'),
        ),
        migrations.AlterField(
            model_name='banner',
            name='link_url',
            field=models.URLField(max_length=100, verbose_name='链接地址'),
        ),
    ]
