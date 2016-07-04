from __future__ import unicode_literals

from django.apps import AppConfig


class EasyAccountConfig(AppConfig):
    name = 'easy_account'

    def ready(self):
        import signals