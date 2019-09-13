from django.shortcuts import render, get_object_or_404

# Create your views here.
from django.views.generic import ListView

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
        context['Category'] = cate.name
        return context


class TagsListView(ListView):
    model = Article
    template_name = 'blog/tags_list.html'
    context_object_name = 'articles'

    def get_queryset(self, **kwargs):
        queryset = super(TagsListView, self).get_queryset()
        tag = get_object_or_404(Tags, slug=self.kwargs.get('slug'))
        return queryset.filter(tags=tag)

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(TagsListView, self).get_context_data()
        tag = get_object_or_404(Tags, slug=self.kwargs.get('slug'))
        context['Tags'] = tag
        return context
