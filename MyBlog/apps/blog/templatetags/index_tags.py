# coding:utf-8
from django import template
from django.db.models import Count

from blog.models import Article, Banner, Tags, FriendLink, Category

register = template.Library()


@register.simple_tag()
def get_hot_article():
    """
    获取最热门文章
    """
    article = Article.objects.order_by('-scan_num')[0:10]
    return article


@register.simple_tag()
def get_banner_list():
    """
    获取首页轮播图
    :return:
    """
    banner = Banner.objects.order_by('-order_index')[0:5]
    return banner


@register.simple_tag()
def get_all_tags():
    """
    获取所有标签
    :return:
    """
    return Tags.objects.annotate(total_num=Count('article')).filter(total_num__gt=0)


@register.simple_tag()
def get_all_category():
    """
    获取所有分类
    :return:
    """
    return Category.objects.annotate(total_num=Count('article')).filter(total_num__gt=0)


@register.simple_tag()
def get_friend_link():
    """
    获取要显示的友链
    :return:
    """
    friend_link = FriendLink.objects.filter(is_show=True)
    return friend_link[0:5]


@register.simple_tag()
def list_hot(queryset):
    """
    按热度排序
    :param queryset:
    :return:
    """
    hot_list = queryset.order_by('-scan_num')
    return hot_list




# @register.simple_tag()
# def category_new()
