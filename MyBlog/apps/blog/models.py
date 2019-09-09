from datetime import datetime

from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class Tags(models.Model):
    name = models.CharField(max_length=30, verbose_name='标签名称')

    class Meta:
        db_table = 'tags'
        verbose_name = '标签'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=30, verbose_name='分类名称')

    class Meta:
        db_table = 'category'
        verbose_name = '分类'
        verbose_name_plural = verbose_name
        ordering = ['name']

    def __str__(self):
        return self.name


class Article(models.Model):
    IMG_LINK = ''
    title = models.CharField(max_length=100, verbose_name='标题')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name='文章分类')
    tags = models.ManyToManyField(Tags, verbose_name='标签')
    content = models.TextField(verbose_name='文章内容')
    img_link = models.CharField(verbose_name='图片地址', default=IMG_LINK, max_length=255)
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    scan_num = models.PositiveIntegerField(max_length=10, verbose_name='浏览量')
    create_time = models.DateTimeField(verbose_name='发布时间', auto_now_add=True)

    class Meta:
        db_table = 'article'
        verbose_name = '文章'
        verbose_name_plural = verbose_name
        ordering = ['-create_time']

    def __str__(self):
        return self.title


class Banner(models.Model):
    order_index = models.IntegerField(max_length=10, verbose_name='轮播顺序')
    title = models.CharField(null=True, blank=True, max_length=100, verbose_name='标题')
    img = models.ImageField(verbose_name='图片')
    link_url = models.URLField(verbose_name='链接地址')
    is_active = models.BooleanField(verbose_name='是否激活')

    class Meta:
        db_table = 'banner'
        verbose_name = '图片轮播'
        verbose_name_plural = verbose_name
        ordering = ['order_index', '-id']


class FriendLink(models.Model):
    name = models.CharField(max_length=70, verbose_name='友链名字')
    link_url = models.URLField(verbose_name='链接地址')
    is_show = models.BooleanField(default=False, verbose_name='是否显示')

    class Meta:
        db_table = 'friendlink'
        verbose_name = '友情链接'
        verbose_name_plural = verbose_name

