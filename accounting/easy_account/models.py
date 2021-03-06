from __future__ import unicode_literals
import uuid

import django
from django.db import models


class AccountPlace(models.Model):
    """
    Physical location where you receive or spend money
    """

    def __unicode__(self):
        return self.name

    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    name = models.TextField


class DebitPlace(AccountPlace):
    pass


class CreditPlace(AccountPlace):
    pass


class Account(models.Model):

    """
    An "Account" is a generic place to hold or spend money.
    It might be a bank account, a wallet, "groceries", under the mattress etc.
    """

    def __unicode__(self):
        return self.name

    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    name = models.TextField(unique=True)
    currency = models.TextField(max_length=5, default="USD")


class Capital(Account):

    account = models.OneToOneField('Account', parent_link=True)
    openingbalance = models.DecimalField(max_digits=20, decimal_places=2)
    balance = models.DecimalField(max_digits=20, decimal_places=2) # Running total of cash value


class Asset(Account):
    """
    Asset
    """
    account = models.OneToOneField('Account', parent_link=True)
    value = models.DecimalField(max_digits=20, decimal_places=2)


class Debit(Account):
    """
    A category describing where money is spent
    """
    account = models.OneToOneField('Account', parent_link=True)


class Revenue(Account):
    """
    A category describing where money is earned from
    """
    account = models.OneToOneField('Account', parent_link=True)


class Liability(Account):
    """
    Loans etc
    """
    account = models.OneToOneField('Account', parent_link=True)
    balance = models.DecimalField(max_digits=20, decimal_places=2) # Running total of cash value
    due = models.DateField(null=True,  blank=True)


class BalanceCheck(models.Model):
    """
    Confirmation of the balance in an account or wallet
    """
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    store = models.ForeignKey(Capital)
    balance = models.DecimalField(max_digits=20, decimal_places=2)
    time = models.DateTimeField(default=django.utils.timezone.now)


class Transaction(models.Model):
    """
    Move money between Accounts with a Transaction.
    The amount remaining in account(s) is recalculated with a signal where the account has an "estimatedbalance".
    """

    def __unicode__(self):
        return self.name

    id = models.UUIDField(primary_key=True, default=uuid.uuid4)

    from_account = models.ForeignKey(Account, related_name = "transactions_from")
    to_account = models.ForeignKey(Account, related_name = "transactions_to")

    name = models.TextField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    time = models.DateTimeField(default=django.utils.timezone.now)
    amount = models.DecimalField(max_digits=20, decimal_places=2)


