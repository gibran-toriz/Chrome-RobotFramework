from flask import Flask, request, jsonify
import requests
import json
import os
import base64

app = Flask(__name__)

@app.route('/selenium/start', methods=['POST'])
def start():
    data = request.get_json()
    mensaje = data.get('message')
    print(mensaje)
    if 'c29tZS1hcGlrZXk=' in mensaje:
        res = os.system('/home/apps/selenium/run.sh')
        output = file2base64()
        return jsonify({"execute":output[0], "result":output[1]})
    else:
        return jsonify({"execute":"ERROR", "result":"Access Denied"})


def file2base64():
    text_file = open('/home/apps/selenium/output/output.xml','r')
    data = text_file.read()
    status = 'PASS'
    if 'FAIL' in data:
        status = 'FAIL'
    text_file.close()
    message_bytes = data.encode('UTF-8')
    base64_bytes = base64.b64encode(message_bytes)
    base64_message = base64_bytes.decode('UTF-8')
    return status, base64_message



if __name__ == '__main__':
        app.run(host='0.0.0.0' , port=5901)



