from datetime import datetime

from django.db import models
from django.contrib.auth import get_user_model
from uuslug import slugify

from DjangoUeditor.models import UEditorField

User = get_user_model()


class Tags(models.Model):
    name = models.CharField(max_length=30, verbose_name='标签名称', unique=True)
    slug = models.SlugField(unique=True, null=True)

    class Meta:
        db_table = 'tags'
        verbose_name = '标签'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Tags, self).save(*args, **kwargs)


class Category(models.Model):
    name = models.CharField(max_length=30, verbose_name='分类名称')
    slug = models.SlugField(unique=True, null=True)

    class Meta:
        db_table = 'category'
        verbose_name = '分类'
        verbose_name_plural = verbose_name
        ordering = ['name']

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Category, self).save(*args, **kwargs)


class Article(models.Model):
    IMG_LINK = 'front_img/default.jpg'
    title = models.CharField(max_length=100, verbose_name='标题')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name='文章分类')
    tags = models.ManyToManyField(Tags, verbose_name='标签')
    desc = models.CharField(max_length=200, verbose_name='文字简述', default='')
    content = UEditorField(verbose_name='文章内容', width=800, height=500,
                    toolbars="full", imagePath="articleimg/", filePath="articlefile/",
                    upload_settings={"imageMaxSize": 1204000},
                    settings={}, command=None, blank=True)
    img_link = models.ImageField(verbose_name='封面图片', upload_to='front_img/', default=IMG_LINK, max_length=255)
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    scan_num = models.PositiveIntegerField(max_length=10, verbose_name='浏览量')
    create_time = models.DateTimeField(verbose_name='发布时间', auto_now_add=True)
    update_time = models.DateTimeField(verbose_name='修改时间', auto_now=True)
    slug = models.SlugField(unique=True, null=True)

    class Meta:
        db_table = 'article'
        verbose_name = '文章'
        verbose_name_plural = verbose_name
        ordering = ['-create_time']  # 默认为按时间排序

    def __str__(self):
        return self.title

    # 浏览量+1
    def viewed(self):
        self.scan_num += 1
        self.save(update_fields=['scan_num'])


class Banner(models.Model):
    order_index = models.IntegerField(max_length=10, verbose_name='轮播顺序')
    title = models.CharField(null=True, blank=True, max_length=100, verbose_name='标题')
    img = models.ImageField(verbose_name='图片', upload_to='banner/')
    link_url = models.URLField(verbose_name='链接地址', max_length=100)
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

