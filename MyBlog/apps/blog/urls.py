# coding:utf-8
from django.urls import re_path, path
from blog.views import IndexView, CategoryListView, TagsListView

urlpatterns = [
    re_path('^index/', IndexView.as_view(), name='index'),
    re_path(r'category/(?P<slug>[\w-]+)/', CategoryListView.as_view(), name='category_list'),
    re_path(r'tags/(?P<slug>[\w-]+)/', TagsListView.as_view(), name='tags_list'),
    # re_path(r'list/', ArticleListView.as_view(), name='list')
]