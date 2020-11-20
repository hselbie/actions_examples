import jinja2
import os

# Get the list of user's
# environment variables
env_var = os.environ
env_var = dict(env_var)

template = jinja2.Template("""
[Looker]
api_version=4.0
base_url={{ base_url }}
client_id={{client_id}}
client_secret={{client_secret}}
verify_ssl=False
""").stream(
    base_url=env_var.get('BASE_URL'),
    client_id=env_var.get('CLIENT_ID'),
    client_secret=env_var.get('CLIENT_SECRET')
    ).dump('looker.ini')
