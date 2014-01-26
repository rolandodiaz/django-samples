# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
#from website.views import InternalErrorView

admin.autodiscover()

urlpatterns = patterns('',
    #ADMINISTRACION
    #url(r'^admin/filebrowser/', include(site.urls)),
    (r'^grappelli/', include('grappelli.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^', include('upc.sunat.urls'))
)

handler500 = 'upc.sunat.views.internal_error_view'
handler404 = 'upc.sunat.views.redirect_view'

if settings.DEBUG:
    from django.views.static import serve
    urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$',
            serve, {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
        url(r'^static/(?P<path>.*)$',
            serve, {'document_root': settings.STATIC_ROOT}),    
    )