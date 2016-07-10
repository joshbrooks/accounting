from rest_framework import serializers

from .models import Account, Capital, Transaction, Asset, Debit, Revenue, Liability


class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ('id', 'name', 'currency')


class AssetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Asset
        fields = ('id', 'name', 'currency')


class LiabilitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Liability
        fields = ('id', 'name', 'currency','balance', 'due')


class DebitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Debit
        fields = ('id', 'name', 'currency')


class RevenueSerializer(serializers.ModelSerializer):
    class Meta:
        model = Revenue
        fields = ('id', 'name', 'currency')


class CapitalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Capital
        fields = ('id', 'name', 'currency', 'openingbalance', 'balance')


class AccountSerializer_id_name(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ('id', 'name')


class TransactionSerializer(serializers.ModelSerializer):

    # from_account = AccountSerializer_id_name()
     #to_account = AccountSerializer_id_name()

    class Meta:
        model = Transaction
        fields = ('id', 'from_account', 'to_account', 'name', 'description', 'time', 'amount')
