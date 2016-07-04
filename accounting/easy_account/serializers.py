from rest_framework import serializers

from .models import Account, Capital, Transaction


class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ('id', 'name', 'currency')


class CapitalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Capital
        fields = ('id', 'name', 'currency', 'openingbalance', 'estimatedbalance')


class TransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transaction
        fields = ('id', 'type', 'store','name', 'description', 'time', 'amount', 'storebalance')
