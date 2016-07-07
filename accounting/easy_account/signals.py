import logging
import uuid

from django.db import models
from django.db.models.signals import pre_save, pre_init, post_save
from django.dispatch import receiver

from .models import Capital, Account, BalanceCheck, Transaction

logger = logging.getLogger(__name__)


@receiver(pre_save, sender=Capital)
def initial_estimated_balance(sender, instance, **kwargs):
    # Make estimated balance = opening balance on "opening" a CapitalAccount
    if instance.pk is None:
        instance.estimatedbalance=instance.openingbalance


@receiver(pre_save, sender=Account)
def create_pk_if_not_existing(sender, instance, **kwargs):
    # pk might be supplied by the API via JavaScript (for offline use)
    # If it is not, we'll create it here
    # Make estimated balance = opening balance on "opening" a CapitalAccount
    if instance.pk is None:
        instance.pk=uuid.uuid4()

@receiver(post_save, sender=Transaction)
def set_account_balances(sender, created, instance, **kwargs):

    if hasattr(instance.from_account, 'capital'):
        acc = instance.from_account
        print acc.capital.estimatedbalance
        acc.capital.estimatedbalance -= instance.amount
        print acc.capital.estimatedbalance
        acc.capital.save()
        acc.save()

    if hasattr(instance.to_account, 'capital'):
        acc = instance.to_account
        print acc.capital.estimatedbalance
        acc.capital.estimatedbalance += instance.amount
        print acc.capital.estimatedbalance
        acc.capital.save()
        acc.save()