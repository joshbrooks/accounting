# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-06 07:21
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.TextField(unique=True)),
                ('currency', models.TextField(default='USD', max_length=5)),
            ],
        ),
        migrations.CreateModel(
            name='AccountPlace',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='BalanceCheck',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, primary_key=True, serialize=False)),
                ('balance', models.DecimalField(decimal_places=2, max_digits=20)),
                ('time', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='Transaction',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.TextField(blank=True, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('time', models.DateTimeField(default=django.utils.timezone.now)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=20)),
            ],
        ),
        migrations.CreateModel(
            name='Asset',
            fields=[
                ('account', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='easy_account.Account')),
            ],
            bases=('easy_account.account',),
        ),
        migrations.CreateModel(
            name='Capital',
            fields=[
                ('account', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='easy_account.Account')),
                ('openingbalance', models.DecimalField(decimal_places=2, max_digits=20)),
                ('estimatedbalance', models.DecimalField(decimal_places=2, max_digits=20)),
            ],
            bases=('easy_account.account',),
        ),
        migrations.CreateModel(
            name='CreditPlace',
            fields=[
                ('accountplace_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='easy_account.AccountPlace')),
            ],
            bases=('easy_account.accountplace',),
        ),
        migrations.CreateModel(
            name='Debit',
            fields=[
                ('account', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='easy_account.Account')),
            ],
            bases=('easy_account.account',),
        ),
        migrations.CreateModel(
            name='DebitPlace',
            fields=[
                ('accountplace_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='easy_account.AccountPlace')),
            ],
            bases=('easy_account.accountplace',),
        ),
        migrations.CreateModel(
            name='Liability',
            fields=[
                ('account', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='easy_account.Account')),
            ],
            bases=('easy_account.account',),
        ),
        migrations.CreateModel(
            name='Revenue',
            fields=[
                ('account', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='easy_account.Account')),
            ],
            bases=('easy_account.account',),
        ),
        migrations.AddField(
            model_name='transaction',
            name='from_account',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='transactions_from', to='easy_account.Account'),
        ),
        migrations.AddField(
            model_name='transaction',
            name='to_account',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='transactions_to', to='easy_account.Account'),
        ),
        migrations.AddField(
            model_name='balancecheck',
            name='store',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='easy_account.Capital'),
        ),
    ]
