
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
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.binary_location='/opt/google/chrome/google-chrome'
    options.add_argument('--disable-dev-shm-usage')
    # 配置到实例 chromedriver路径不能写在options里面，否则会找不到
    browser = webdriver.Chrome('/opt/google/chrome/chromedriver',chrome_options=options)
    cc = browser.get("http://www.baidu.com")
    #text = pytesseract.image_to_string('./123.png')
    return '1234'



if __name__ == '__main__':
    app.run(host='0.0.0.0',port='5000')
    #test()
