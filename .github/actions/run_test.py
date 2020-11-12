import looker_sdk
sdk = looker_sdk.init31(config_file='ini/looker.ini')
print(sdk.me())