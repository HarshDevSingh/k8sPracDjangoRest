from django.contrib.auth.models import User
from django.core.management import BaseCommand


class Command(BaseCommand):
    help = 'Create a superuser if not exists'

    def add_arguments(self, parser):
        parser.add_argument('--username', type=str, help='Specifies the username for the superuser')
        parser.add_argument('--email', type=str, help='Specifies the email for the superuser')
        parser.add_argument('--password', type=str, help='Specifies the password for the superuser')
        parser.add_argument(
            '--no-input',
            action='store_true',
            help='Do not prompt for input of any kind. All input will be taken from command line arguments.',
        )

    def handle(self, *args, **kwargs):
        no_input = kwargs['no_input']
        username = kwargs['username']
        email = kwargs['email']
        password = kwargs['password']

        if no_input and not (username and email and password):
            self.stdout.write(
                self.style.ERROR('Please provide --username, --email, and --password when using --no-input'))
            return

        if not no_input:
            username = input('Username: ')
            email = input('Email: ')
            password = input('Password: ')

        # Check if the superuser already exists
        if User.objects.filter(is_superuser=True).exists():
            self.stdout.write(self.style.WARNING('Superuser already exists.'))
        else:
            try:
                user = User.objects.create_superuser(username=username, email=email, password=password)
                self.stdout.write(self.style.SUCCESS(f'Superuser {username} successfully created!'))
            except Exception as e:
                self.stdout.write(self.style.ERROR(f'Error creating superuser: {e}'))
