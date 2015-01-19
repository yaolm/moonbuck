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
    ('^crm/adduser/$',views.crm_adduser),
    ('^crm/search/$',views.crm_user_search),
    ('^crm/search/result/$',views.crm_user_searchresult),
    ('^crm/add/$',views.crm_adduser),

)
