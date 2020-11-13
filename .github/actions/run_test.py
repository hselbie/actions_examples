import looker_sdk
import argparse
import configparser as ConfigParser
import os
import pprint 


if __name__ == "__main__":
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
    ini_file = '.github/actions/looker.ini'
    # config = ConfigParser.RawConfigParser(allow_no_value=True)
    # config.read(ini_file)
    # # t = config.get('Looker', 'base_url')
    # # print(t)


    sdk = looker_sdk.init31(config_file=ini_file)

    # print(sdk.me())