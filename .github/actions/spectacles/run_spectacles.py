import subprocess

if __name__ == "__main__":
    sdk = looker_sdk.init31()
    env_var = os.environ
    env_var = dict(env_var)

    base_url = env_var.get('BASE_URL')
    space_data = get_space_data()
    print("Checking for broken content in production.")
    
        spectacles sql --project hugo_sandbox --branch master --base-url https://profservices.dev.looker.com --client-id b88cXDHjbkMwvbwCWXCj --client-secret jbH2X6JCDJqyh2nR6HWFm3Q5 -v

sql_response = subprocess.run(
    ['spectacles',
    'sql',
    '--project', ,
    '--host',
    GZR_INSTANCE_NAME,
    '--dir',
    f'{content_type}_backup']
                )