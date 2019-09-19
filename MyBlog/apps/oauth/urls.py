# coding:utf-8
from django.urls import re_path, path

from oauth.views import profile, profile_update

app_name = 'oauth'

urlpatterns = [
    path('profile', profile, name='profile'),
    path('change_profile', profile_update, name='change_profile')


]
