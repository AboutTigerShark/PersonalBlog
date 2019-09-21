# coding:utf-8
from django.urls import path, re_path

from comment.views import addcommentview

urlpatterns = [

    re_path(r'add/$', addcommentview, name='add_comment'),

]
