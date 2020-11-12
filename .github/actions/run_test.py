import looker_sdk
sdk = looker_sdk.init31(config_file='.github/actions/test_instance.ini')
print(sdk.me())