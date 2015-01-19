# -*- coding:utf8 -*-

from django.conf.urls import patterns, include, url
from moonbuck.mis import views
from django.conf import settings

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()
urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'moonbuck.views.home', name='home'),
    # url(r'^moonbuck/', include('moonbuck.moonbuck.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
    (r'^static/(?P<path>.*)$', 'django.views.static.serve',{ 'document_root':settings.STATIC_ROOT }),
    
    ('^index/$',views.homepage),
    ('^crm/$',views.crmHome),
    ('^prm/$',views.prmHome),

    #下面是crm的三个主要功能

    #1积分制度等设置
    ('^crm/favor/$',views.favor),
    
    #2CRM查询的两个页面
    ('^crm/search/$',views.crm_user_search),
    ('^crm/search/result/$',views.crm_user_searchresult),
    #2增加用户，用户管理
    ('^crm/add/$',views.crm_adduser),
    #3优惠项目列出来
    ('^crm/project/$',views.crmproject),
    ('^crm/project/add/$',views.crmaddproject),
    #3具体优惠政策
    ('^crm/project/detail/$',views.crmprojectdetail),


    #下面是PRM
    ('^prm/project/$',views.prmproject),
    ('^prm/add/item/$',views.additem),
    ('^prm/add/media/$',views.addmedia),
    ('^prm/project/detail/$',views.prmprojectdetail),

)
