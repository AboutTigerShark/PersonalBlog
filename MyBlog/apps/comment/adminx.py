# coding:utf-8
import xadmin
from comment.models import ArticleComment


class CommentAdmin(object):
    list_display = ['id', 'user', 'belong', 'create_time', 'show_content']
    # list_filter = ['belong']
    list_display_links = ['id', 'show_content']

    def show_content(self, obj):
        return obj.content[:30]


xadmin.site.register(ArticleComment, CommentAdmin)
