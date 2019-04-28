from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
from django.db import IntegrityError


class Command(BaseCommand):
    help = 'Create admin user'

    def add_arguments(self, parser):
        parser.add_argument('identity', type=str)

    def handle(self, *args, **options):
        identity = options['identity']
        try:
            user = User(
                username=identity,
                is_staff=True,
                is_superuser=True,
            )
            user.set_password(identity)
            user.save()
            self.stdout.write(self.style.SUCCESS(
                'Successfully created su "{}"'.format(identity))
            )
        except IntegrityError as e:
            self.stdout.write(self.style.ERROR(e))
