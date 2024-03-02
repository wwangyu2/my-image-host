- ### **zhile佬的接口**
   ```
  import requests
  import json

  url = "https://api.deeplx.org/translate"

  payload = json.dumps({
    "text": "Hello, world!",
    "source_lang": "auto",
    "target_lang": "ZH"
  })
  headers = {
    'Content-Type': 'application/json'
  }

  response = requests.request("POST", url, headers=headers, data=payload)

  print(response.text)
  ```
<br>
<br>
<br>


- **免费的GPT的API**  
  ```
  curl https://api.xyhelper.cn/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer sk-api-xyhelper-cn-free-token-for-everyone-xyhelper" \
  -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "system", "content": "You are a helpful assistant."}, {"role": "user", "content": "Hello!"}],
    "stream": true
  }'
  ```