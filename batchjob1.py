import requests

url = "https://api.publicapis.org/entries"

payload = {}
headers = {}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
