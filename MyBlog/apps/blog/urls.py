# coding:utf-8
from django.urls import re_path, path
from blog.views import IndexView, CategoryListView, TagsListView, ArticleDetailView, AllArticleListView, aboutme

urlpatterns = [
    re_path('^index/$', IndexView.as_view(), name='index'),
    re_path(r'category/(?P<slug>[\w-]+)/$', CategoryListView.as_view(), name='category_list'),
    re_path(r'category/(?P<slug>[\w-]+)/hot/$', CategoryListView.as_view(), name='category_list_hot'),
    re_path(r'tags/(?P<slug>[\w-]+)/$', TagsListView.as_view(), name='tags_list'),
    re_path(r'tags/(?P<slug>[\w-]+)/hot/$', TagsListView.as_view(), name='tags_list_hot'),
    re_path(r'article-(?P<slug>[\d])/$', ArticleDetailView.as_view(), name='article_detail'),
    re_path(r'blog/$', AllArticleListView.as_view(), name='all_articles'),
    re_path('blog/hot/$', AllArticleListView.as_view(), kwargs={'sort': 1}, name='all_articles_hot'),
    re_path(r'about/$', aboutme, name='aboutme')
    # re_path(r'list/', ArticleListView.as_view(), name='list')
]