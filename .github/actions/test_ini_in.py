import jinja2
import os

# Get the list of user's
# environment variables
env_var = os.environ
env_var = dict(env_var)
data = {
    "base_url": env_var.get('BASE_URL'),
    "client_id": env_var.get('CLIENT_ID'),
    "client_secret": env_var.get('CLIENT_SECRET'),
}

template = """
[Looker]
api_version=4.0
base_url={{ base_url }}
client_id={{client_id}}
client_secret={{client_secret}}
verify_ssl=False
"""

j2_template = jinja2.Template(template)

with open ('looker.ini', 'w') as ini_file:
    ini_file.write(j2_template)

