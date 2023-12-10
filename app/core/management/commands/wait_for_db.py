import time

from django.core.management.base import BaseCommand
from django.db import connections
from django.db.utils import OperationalError


class Command(BaseCommand):
    help = 'Waits for database to be available'

    def handle(self, *args, **options):
        self.stdout.write('Waiting for MySQL database...')
        time.sleep(10)
        db_conn = None
        attempts = 0
        while not db_conn and attempts <= 30:
            try:
                db_conn = connections['default']
            except OperationalError:
                attempts += 1
                self.stdout.write('Database unavailable, waiting 1 second...')
                time.sleep(1)
        self.stdout.write(self.style.SUCCESS('MySQL database is available!'))
