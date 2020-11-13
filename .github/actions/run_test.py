import looker_sdk
import argparse
from io import StringIO   



if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--id', type=str)
    parser.add_argument('--secret', type=str)
    parser.add_argument('--base', type=str)
    args = parser.parse_args()


    print(f'this is my test {args.id}')
    # sdk = looker_sdk.init31(config_file='test_instance.ini')
    # print(sdk.me())

    # Importing the StringIO module. 
  
    string = f'''
    [Looker]
    api_version=4.0
    base_url={args.base}
    client_id={args.id}
    client_secret={args.secret}
    verify_ssl=False'''
    
    ini_file = StringIO(string) 

    sdk = looker_sdk.init31(config_file=string)

    print(sdk.me())