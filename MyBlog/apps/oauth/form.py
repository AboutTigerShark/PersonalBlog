# # coding:utf-8
import re

from django import forms
from django.contrib.auth import get_user_model

from oauth.models import Ouser

User = get_user_model()


class ProfileForm(forms.ModelForm):
    class Meta:
        model = Ouser
        fields = ['link', 'avatar']

























# def email_check(email):
#     pattern = re.compile(r"\"?([-a-zA-Z0-9.`?{}]+@\w+\.\w+)\"?")
#     return re.match(pattern, email)
#
# class RegisterForm(forms.Form):
#     username = forms.CharField(
#         label='用户名',
#         required=True,
#         max_length=20,
#         min_length=6,
#         error_messages={
#             'required': '用户名不能为空',
#             # 'max_length': '用户名长度不得超过20个字符',
#             # 'min_length': '用户名长度不得少于6个字符',
#         }
#     )
#     password1 = forms.CharField(
#         label='密码',
#         required=True,
#         max_length=20,
#         min_length=6,
#         error_messages={
#             'required': '密码不能为空',
#             # 'max_length': '密码长度不得超过20个字符',
#             # 'min_length': '密码长度不得少于6个字符',
#         },
#         widget=forms.PasswordInput
#     )
#     password2 = forms.CharField(
#         label='确认密码',
#         required=True,
#         max_length=20,
#         min_length=6,
#         widget=forms.PasswordInput
#     )
#     email = forms.EmailField(label='邮箱', max_length=40)
#
#
#     def clean_username(self):
#         username = self.cleaned_data.get('username')
#
#         if len(username) < 6:
#             raise forms.ValidationError("Your username must be at least 6 characters long.")
#         elif len(username) > 20:
#             raise forms.ValidationError("Your username is too long.")
#         else:
#             filter_result = User.objects.filter(username__exact=username)
#             if len(filter_result) > 0:
#                 raise forms.ValidationError("Your username already exists.")
#
#         return username
#
#     def clean_email(self):
#         email = self.cleaned_data.get('email')
#
#         if email_check(email):
#             filter_result = User.objects.filter(email__exact=email)
#             if len(filter_result) > 0:
#                 raise forms.ValidationError("Your email already exists.")
#         else:
#             raise forms.ValidationError("Please enter a valid email.")
#
#         return email
#
#     def clean_password1(self):
#         password1 = self.cleaned_data.get('password1')
#
#         if len(password1) < 6:
#             raise forms.ValidationError("Your password is too short.")
#         elif len(password1) > 20:
#             raise forms.ValidationError("Your password is too long.")
#
#         return password1
#
#     def clean_password2(self):
#         password1 = self.cleaned_data.get('password1')
#         password2 = self.cleaned_data.get('password2')
#
#         if password1 and password2 and password1 != password2:
#             raise forms.ValidationError("Password mismatch. Please enter again.")
#
#         return password2
#
#
# class LoginForm(forms.Form):
#     username = forms.CharField(label='用户名', max_length=50)
#     password = forms.CharField(label='密码', widget=forms.PasswordInput)
#
#     # Use clean methods to define custom validation rules
#
#     def clean_username(self):
#         username = self.cleaned_data.get('username')
#
#         if email_check(username):
#             filter_result = User.objects.filter(email__exact=username)
#             if not filter_result:
#                 raise forms.ValidationError("This email does not exist.")
#         else:
#             filter_result = User.objects.filter(username__exact=username)
#             if not filter_result:
#                 raise forms.ValidationError("This username does not exist. Please register.")
#
#         return username
#
#
# class FotGetForm(forms.Form):
#     old_password = forms.CharField(label='旧密码', widget=forms.PasswordInput)
#     new_password = forms.CharField(label='新密码', widget=forms.PasswordInput)
#     confirm_password = forms.CharField(label='确认密码', widget=forms.PasswordInput)
#
#     def clean_new_password(self):
#         new_password = self.cleaned_data.get('new_password')
#
#         if len(new_password) < 6:
#             raise forms.ValidationError("Your password is too short.")
#         elif len(new_password) > 20:
#             raise forms.ValidationError("Your password is too long.")
#
#         return new_password
#
#     def clean_confirm_password(self):
#         new_password = self.cleaned_data.get('new_password')
#         confirm_password = self.cleaned_data.get('confirm_password')
#
#         if new_password and confirm_password and new_password != confirm_password:
#             raise forms.ValidationError("Password mismatch. Please enter again.")
#
#         return confirm_password
