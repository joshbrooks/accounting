"""accounting URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.views.decorators.cache import cache_page
from django.views.i18n import javascript_catalog
from django_js_reverse.views import urls_js

import settings
from easy_account import urls as easy_account_urls


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^', include( easy_account_urls, namespace='accounts')),
    url(r'^jsi18n/(?P<packages>\S+?)/$', javascript_catalog, name='javascript-catalog'),
    url(r'^jsi18n/$', javascript_catalog, name='javascript-catalog'),
    url(r'^i18n/', include('django.conf.urls.i18n')),
]

if 'django_js_reverse' in settings.INSTALLED_APPS:
    urlpatterns += [url(r'^jsreverse/$', cache_page(3600)(urls_js), name='js_reverse')]

if 'rosetta' in settings.INSTALLED_APPS:
    urlpatterns += [url(r'^rosetta/', include('rosetta.urls'))]
