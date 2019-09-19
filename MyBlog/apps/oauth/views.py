from django.contrib import auth, messages
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404

# Create your views here.
from django.urls import reverse

from oauth.form import ProfileForm

User = get_user_model()

@login_required
def profile(request):
    user = request.user
    return render(request, 'oauth/profile.html', {'user': user})


@login_required
def profile_update(request):
    if request.method == 'POST':
        # 上传文件需要使用request.FILES
        form = ProfileForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            form.save()
            # 添加一条信息,表单验证成功就重定向到个人信息页面
            messages.add_message(request, messages.SUCCESS, '个人信息更新成功！')
            return redirect('oauth:profile')
    else:
        # 不是POST请求就返回空表单
        form = ProfileForm(instance=request.user)
    return render(request, 'oauth/change_profile.html', {'form': form})























# def login(request):
#     if request.method == 'POST':
#         form = LoginForm(request.POST)
#         if form.is_valid():
#
#             username = form.cleaned_data['username']
#             password = form.cleaned_data['password']
#
#             user = auth.authenticate(username=username, password=password)
#
#             if user is not None and user.is_active:
#                 auth.login(request, user)
#                 # return HttpResponseRedirect(reverse('users:profile', args=[user.id]))
#                 return redirect('/index/')
#
#             else:
#
#                 # 登陆失败
#                 return render(request, 'oauth/index.html', {'form': form,
#                               'message': 'Wrong password. Please try again.'})
#     else:
#         form = LoginForm()
#
#     return render(request, 'oauth/index.html', {'form': form})
#
#
# def register(request):
#     if request.method == 'POST':
#         form = RegisterForm(request.POST)
#         if form.is_valid():
#             username = form.cleaned_data['username']
#             email = form.cleaned_data['email']
#             password = form.cleaned_data['password2']
#             # 使用内置User自带create_user方法创建用户，不需要使用save()
#             user = User.objects.create_user(username=username, password=password, email=email)
#             # 如果直接使用objects.create()方法后不需要使用save()
#             # user_profile = Ouser(user=user)
#             # user_profile.save()
#             return HttpResponseRedirect("/oauth/login/")
#
#     else:
#         form = RegisterForm()
#         return render(request, 'oauth/sign-up.html', {'form': form})
#
#
# @login_required
# def forget(request, pk):
#     user = get_object_or_404(User, pk=pk)
#     if request.method == 'POST':
#         form = FotGetForm(request.POST)
#         if form.is_valid():
#
#             username = user.username
#             password = form.cleaned_data['old_password']
#             user = auth.authenticate(username=username, password=password)
#
#             if user is not None and user.is_active:
#                 new_password = form.cleaned_data['confirm_password']
#                 user.set_password = new_password
#                 user.save()
#                 return redirect('/login/')
#             else:
#                 return render(request, 'oauth/forgot.html', {'form': form, 'user': user,
#                                        'message': 'Old password is wrong. Try again'})
#     else:
#         form = FotGetForm()
#         return render(request, 'oauth/forgot.html', {'form': form, 'user': user})
#
#
# def logout(request):
#     auth.logout(request)
#     return redirect('/index/')
#


