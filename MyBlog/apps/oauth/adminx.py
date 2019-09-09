# coding:utf-8
import xadmin
from xadmin import views
from .models import Ouser


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "个人博客后台"
    site_footer = "TigerShark"
    # menu_style = "accordion"


class OuserAdmin(object):
    list_display = ['username', 'email', 'link', 'avatar']

xadmin.site.unregister(Ouser)
xadmin.site.register(Ouser, OuserAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)