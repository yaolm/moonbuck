from django.conf.urls import patterns, include, url
from .mis import views

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
<<<<<<< HEAD
    ('^index/$',views.homepage),
    ('^crm/$',views.crmHome),
)
=======
    url(r'^$', views.homepage,),
    #url('^index/$',views.homepage),
    )
>>>>>>> 45ec33a541ed8455d0361b7bb975baefe2f47d6b
