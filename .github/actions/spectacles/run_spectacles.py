import subprocess
import looker_sdk
import os

sdk = looker_sdk.init31()
env_var = os.environ
env_var = dict(env_var)
CLIENT_ID = env_var.get('CLIENT_ID')
CLIENT_SECRET = env_var.get('CLIENT_SECRET')
#test
sql_response = subprocess.run(
    ['spectacles',
    'sql',
    '--project',
    'hugo_sandbox' ,
    '--branch', 
    'master',
    # '${GITHUB_REF##*/}',
    '--base-url', 
    'https://profservices.dev.looker.com',
    '--client-id', 
    'b88cXDHjbkMwvbwCWXCj',
    # CLIENT_ID,
    '--client-secret', 
    'jbH2X6JCDJqyh2nR6HWFm3Q5',
    # CLIENT_SECRET,
    '-v'
    ])