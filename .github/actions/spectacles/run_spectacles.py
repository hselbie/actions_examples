import subprocess
import looker_sdk
import os

sdk = looker_sdk.init31()
env_var = os.environ
env_var = dict(env_var)
CLIENT_ID = env_var.get('CLIENT_ID')
CLIENT_SECRET = env_var.get('CLIENT_SECRET')

sql_response = subprocess.run(
    ['spectacles',
    'sql',
    '--project','hugo_sandbox' ,
    '--branch', '${GITHUB_REF##*/}',
    '--base-url', 'https://profservices.dev.looker.com'
    '--client-id', CLIENT_ID,
    '--client-secret', CLIENT_SECRET,
    '-v'
    ])

print(sql_response)