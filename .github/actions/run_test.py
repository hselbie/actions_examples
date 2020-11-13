import looker_sdk
import argparse
from io import StringIO   
import configparser as ConfigParser
import os
import os 
import pprint 
  
# Get the list of user's 
# environment variables 
env_var = os.environ 
  
# Print the list of user's 
# environment variables 
print("User's Environment variable:") 
pprint.pprint(dict(env_var), width = 1) 



# if __name__ == "__main__":
    # parser = argparse.ArgumentParser()
    # parser.add_argument('--id', type=str)
    # parser.add_argument('--secret', type=str)
    # parser.add_argument('--base', type=str)
    # # args = parser.parse_args()


    # sdk = looker_sdk.init31(config_file='test_instance.ini')
    # print(sdk.me())

    # Importing the StringIO module. 
  
    # string = f'''
    # [Looker]
    # api_version=4.0
    # base_url={args.base}
    # client_id={args.id}
    # client_secret={args.secret}
    # verify_ssl=False'''
    # ini_file = '.github/actions/test_instance.ini'
    # config = ConfigParser.RawConfigParser(allow_no_value=True)
    # config.read(ini_file)
    # # t = config.get('Looker', 'base_url')
    # # print(t)


    # sdk = looker_sdk.init31(config_file=ini_file)

    # print(sdk.me())