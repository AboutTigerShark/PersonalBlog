import emoji
import markdown
from django.contrib.auth import get_user_model
from django.db import models

# Create your models here.
from blog.models import Article

User = get_user_model()


class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='评论人', related_name='%(class)s_related')
    create_time = models.DateTimeField('创建时间', auto_now_add=True)
    content = models.TextField('评论内容')
    parent = models.ForeignKey('self', verbose_name='父评论', related_name='%(class)s_child_comments', blank=True,
                               null=True, on_delete=models.CASCADE)
    rep_to = models.ForeignKey('self', verbose_name='回复', related_name='%(class)s_rep_comments', blank=True, null=True,
                               on_delete=models.CASCADE)

    class Meta:
        """虚拟模型类"""
        abstract = True

    def __str__(self):
        return self.content[:20]

    def content_to_markdown(self):
        # 先转换成emoji然后转换成markdown,'escape':所有原始HTML将被转义并包含在文档中
        # to_emoji_content = emoji.emojize(self.content, use_aliases=True)
        to_md = markdown.markdown(self.content,
                                  safe_mode='escape',
                                  extensions=[
                                      'markdown.extensions.extra',
                                      'markdown.extensions.codehilite',
                                  ])
        return to_md


class ArticleComment(Comment):
    belong = models.ForeignKey(Article, related_name='article_comments', verbose_name='所属文章', on_delete=models.CASCADE)

    class Meta:
        verbose_name = '文章评论'
        verbose_name_plural = verbose_name
        ordering = ['create_time']