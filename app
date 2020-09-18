
#!/usr/bin/python
# -*- coding: utf-8 -*-

from flask import Flask
#import pytesseract
from selenium import webdriver

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route("/t")
def test():
    print("开始启动浏览器")
    options = webdriver.ChromeOptions()
    # options设置chrome位置
    options.binary_location = '/usr/local/chromedriver/'
    # 配置到实例
    browser = webdriver.Chrome(chrome_options=options)
    cc = browser.get("http://www.baidu.com")
    #text = pytesseract.image_to_string('./123.png')
    return text



if __name__ == '__main__':
    app.run(host='0.0.0.0',port='5000')
    #test()
