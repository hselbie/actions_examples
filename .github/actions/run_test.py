import looker_sdk

print('this is running')
sdk = looker_sdk.init31(config_file='test_instance.ini')
print(sdk.me())