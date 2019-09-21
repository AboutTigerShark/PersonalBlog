import time
from datetime import datetime

from django.shortcuts import render, get_object_or_404

# Create your views here.
from django.views.generic import ListView, DetailView

from blog.models import Article, Tags, Category


class IndexView(ListView):
    model = Article
    template_name = 'blog/index.html'
    context_object_name = 'articles'

    def get_queryset(self):
        article = Article.objects.all()[0:6]
        return article


class CategoryListView(ListView):
    model = Article
    template_name = 'blog/category_list.html'
    context_object_name = 'articles'

    def get_queryset(self, **kwargs):
        queryset = super(CategoryListView, self).get_queryset()
        cate = get_object_or_404(Category, slug=self.kwargs.get('slug'))
        # cate = Category.objects.get(slug=self.kwargs.get('slug'))
        return queryset.filter(category=cate)

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(CategoryListView, self).get_context_data()
        cate = get_object_or_404(Category, slug=self.kwargs.get('slug'))
        context['Category'] = cate
        return context


class TagsListView(ListView):
    model = Article
    template_name = 'blog/tags_list.html'
    context_object_name = 'articles'

    def get_queryset(self, **kwargs):
        queryset = super(TagsListView, self).get_queryset()
        tag = get_object_or_404(Tags, slug=self.kwargs.get('slug'))
        q = super().get_queryset()
        return queryset.filter(tags=tag)

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(TagsListView, self).get_context_data()
        tag = get_object_or_404(Tags, slug=self.kwargs.get('slug'))
        context['Tags'] = tag
        return context


class ArticleDetailView(DetailView):
    model = Article
    template_name = 'blog/show.html'
    context_object_name = 'articles'

    def get_queryset(self, **kwargs):
        queryset = super(ArticleDetailView, self).get_queryset()
        article = get_object_or_404(Article, slug=self.kwargs.get('slug'))
        return queryset.filter(pk=article.id)

    def get_context_data(self, **kwargs):
        context = super(ArticleDetailView, self).get_context_data()
        article = get_object_or_404(Article, slug=self.kwargs.get('slug'))
        # article = Article.objects.get(pk=self.kwargs.get('slug'))
        context['article_tags'] = article.tags.all()
        context['next_article'] = Article.objects.filter(create_time__gt=article.create_time,
                                                         category=article.category.id).first()
        context['previous_article'] = Article.objects.filter(create_time__lt=article.create_time,
                                                             category=article.category.id).last()
        return context

    def get_object(self, queryset=None):
        # 30分钟后的浏览量才计数,作者忽略
        obj = super(ArticleDetailView, self).get_object(queryset=queryset)
        u = self.request.user
        session = self.request.session
        time_key = "time_{}".format(obj.id)
        read_time = session.get(time_key)
        if u is not obj.user:
            if not read_time:
                obj.viewed()
                session[time_key] = time.time()
            else:
                time_now = time.time()
                if time_now > read_time + 60*30:
                    obj.viewed()
                    session[time_key] = time.time()
        return obj


class AllArticleListView(ListView):
    model = Article
    template_name = 'blog/blog_articles.html'
    context_object_name = 'articles'
