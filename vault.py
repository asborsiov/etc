import hvac
import sys
import requests
client = hvac.Client(url='http://1.1.1.1:1111', token=sys.argv[3])
if client.is_authenticated() == False:
    raise ValueError('User not authenticated. Vault is not accessible or key is not provided')
mount_point = sys.argv[1]
secret_path = sys.argv[2]

read_secret_result = client.secrets.kv.v1.read_secret(
    path=secret_path,
    mount_point=mount_point,
)
keys = read_secret_result['data']
envs = ""
for key, value in keys.items():
    envs = envs + "  " + key + ": " + value + "\n"
if len(envs) < 5:
    raise ValueError('Env value seems to be empty (len < 5)')
print (envs)
