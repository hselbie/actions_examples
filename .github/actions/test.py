import configparser
import io

ini_contents = """
    [Looker]
    base_url:https://34.94.128.147:19999
    """
buf = io.StringIO(ini_contents)
config = configparser.ConfigParser()
config.read_file(buf)
print(config.get('Looker', 'base_url'))