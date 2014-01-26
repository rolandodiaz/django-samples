__author__ = 'herald olivares'

from django.conf.urls import patterns, include, url
from upc.sunat.views import DebtListView

urlpatterns = patterns('',
                       url(r'^$', DebtListView.as_view(), name='debts'),
)