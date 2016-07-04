from django.shortcuts import render
from django.views.generic import TemplateView
from rest_framework.renderers import JSONRenderer

from .models import *
from .serializers import *
# Create your views here.
from rest_framework import generics


class DashBoardView(TemplateView):

    template_name = "frontpage.html"

    def get_context_data(self, **kwargs):
        context = super(DashBoardView, self).get_context_data(**kwargs)
        return context


class AccountList(TemplateView):
    """
    Utilise serialization functions of DjangoRestFramwork to provide a list of all accounts
    :return:
    """
    template_name = "accounts.json"
    def get_context_data(self, **kwargs):

        def _r(serializer):
            return  JSONRenderer().render(serializer.data)

        return {
            'capital' : _r(CapitalSerializer(Capital.objects.all(), many=True)),
            'asset' : _r(AccountSerializer(Asset.objects.all(), many=True)),
            'debit' : _r(AccountSerializer(Debit.objects.all(), many=True)),
            'revenue' : _r(AccountSerializer(Revenue.objects.all(), many=True)),
            'liability' : _r(AccountSerializer(Liability.objects.all(), many=True))
        }

# Class Based DRF Views

class CapitalList(generics.ListCreateAPIView):
    queryset, serializer_class = Capital.objects.all(), CapitalSerializer


class CapitalDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset, serializer_class = Capital.objects.all(), CapitalSerializer


class AssetList(generics.ListCreateAPIView):
    queryset, serializer_class = Asset.objects.all(), AccountSerializer


class AssetDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset, serializer_class = Asset.objects.all(), AccountSerializer
    
    
class DebitList(generics.ListCreateAPIView):
    queryset, serializer_class = Debit.objects.all(), AccountSerializer


class DebitDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset, serializer_class = Debit.objects.all(), AccountSerializer


class RevenueList(generics.ListCreateAPIView):
    queryset, serializer_class = Revenue.objects.all(), AccountSerializer


class RevenueDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset, serializer_class = Revenue.objects.all(), AccountSerializer


class LiabilityList(generics.ListCreateAPIView):
    queryset, serializer_class = Liability.objects.all(), AccountSerializer


class LiabilityDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset, serializer_class = Liability.objects.all(), AccountSerializer



