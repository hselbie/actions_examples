import jinja2
import os

# Get the list of user's 
# environment variables 
env_var = os.environ 
env_var = dict(env_var)
# Print the list of user's 
# environment variables 
# print("User's Environment variable:") 
# pprint.pprint(dict(env_var), width = 1) 

print(env_var.get('BASE_URL'))


# template = """
# [Looker]
# api_version=4.0
# base_url={{ env_var.get(BASE_URL }}
# client_id=$CLIENT_ID
# client_secret=$CLIENT_SECRET
# verify_ssl=False
# """

data = {
    "hostname": "core-sw-waw-01",
    "name_server_pri": "1.1.1.1",
    "name_server_sec": "8.8.8.8",
    "ntp_server_pri": "0.pool.ntp.org",
    "ntp_server_sec": "1.pool.ntp.org",
}

j2_template = Template(template)

print(j2_template.render(data))