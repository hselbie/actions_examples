import looker_sdk
import argparse


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--id', type=str)
    parser.add_argument('--secret', type=str)
    parser.add_argument('--lookml_param', type=str)
    args = parser.parse_args()


    print(args.id)
    # sdk = looker_sdk.init31(config_file='test_instance.ini')
    # print(sdk.me())