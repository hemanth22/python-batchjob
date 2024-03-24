import requests

url = "https://api.publicapis.org/entries"

payload = {}
headers = {}

response = requests.request("GET", url, headers=headers, data=payload)

paydata = response.json()

def print_dict_and_list_recursive(data, indent=0):
    if isinstance(data, dict):
        for key, value in data.items():
            print('  ' * indent + f'{key}:')
            print_dict_and_list_recursive(value, indent + 2)
    elif isinstance(data, list):
        for index, item in enumerate(data):
            print('  ' * indent + f'[{index}]:')
            print_dict_and_list_recursive(item, indent + 2)
    else:
        print('  ' * indent + f'{data}')

print_dict_and_list_recursive(paydata)
