from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$',views.DashBoardView.as_view()),
    url(r'^transactions$',views.TransactionList.as_view()),

    url(r'^accounts$',views.AccountList.as_view()),

    url(r'^accounts/capital$', views.CapitalList.as_view()),
    url(r'^accounts/capital/(?P<pk>[^/]+)/$', views.CapitalDetail.as_view()),

    url(r'^accounts/asset$', views.AssetList.as_view()),
    url(r'^accounts/asset/(?P<pk>[^/]+)/$', views.AssetDetail.as_view()),

    url(r'^accounts/debit$', views.DebitList.as_view()),
    url(r'^accounts/debit/(?P<pk>[^/]+)/$', views.DebitDetail.as_view()),

    url(r'^accounts/revenue$', views.RevenueList.as_view()),
    url(r'^accounts/revenue/(?P<pk>[^/]+)/$', views.RevenueDetail.as_view()),

    url(r'^accounts/liability$', views.LiabilityList.as_view()),
    url(r'^accounts/liability/(?P<pk>[^/]+)/$', views.LiabilityDetail.as_view()),

    ]