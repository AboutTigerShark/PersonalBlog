# coding:utf-8
from django.urls import re_path, path
from blog.views import IndexView, CategoryListView, TagsListView, ArticleDetailView, AllArticleListView

urlpatterns = [
    re_path('^index/', IndexView.as_view(), name='index'),
    re_path(r'category/(?P<slug>[\w-]+)/', CategoryListView.as_view(), name='category_list'),
    re_path(r'tags/(?P<slug>[\w-]+)/', TagsListView.as_view(), name='tags_list'),
    re_path(r'article-(?P<slug>[\d])/', ArticleDetailView.as_view(), name='article_detail'),
    re_path(r'blog/', AllArticleListView.as_view(), name='all_articles'),
    # re_path(r'list/', ArticleListView.as_view(), name='list')
]