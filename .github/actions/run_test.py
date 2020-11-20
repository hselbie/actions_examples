import looker_sdk
import argparse
import configparser as ConfigParser
import os
import pprint 


if __name__ == "__main__":
    sdk = looker_sdk.init31()
    print(sdk.me())