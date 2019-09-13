# coding:utf-8
import xadmin
from .models import Banner, Article, Tags, Category, FriendLink


class ArticleAdmin(object):
    list_display = ["title", "content", "img_link", "scan_num", "create_time"]
    search_fields = ['title', ]
    list_filter = ["title", "content", "img_link", "scan_num", "create_time"]
    style_fields = {"content": "ueditor"}


class TagsAdmin(object):
    list_display = ['name']
    list_filter = ["name"]
    search_fields = ['name', ]
    prepopulated_fields = {"slug": ("name",)}


class CategoryAdmin(object):
    list_display = ["name"]
    list_filter = ["name"]
    search_fields = ['name', ]


class BannerAdmin(object):
    list_display = ["order_index", "title", "img", "link_url", "is_active"]


class FriendLinkAdmin(object):
    list_display = ["name", "link_url", "is_show"]
    list_editable = ['is_show', ]


xadmin.site.register(Article, ArticleAdmin)
xadmin.site.register(Tags, TagsAdmin)
xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(FriendLink, FriendLinkAdmin)
