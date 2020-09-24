
#!/usr/bin/python
# -*- coding: utf-8 -*-

from flask import Flask
#import pytesseract
import platform
from selenium import webdriver

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

CHROME_DRIVER_PATH = '/opt/google/chrome/chromedriver'
CHROME_EXE_DRIVER_PATH = '/opt/google/chrome/google-chrome'

#windows
#CHROME_EXE_DRIVER_PATH = "C:\\Users\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe"
@app.route("/t")
def test():
    print("开始启动浏览器")
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    #强制设置分辨率，使用最大设置无效
    options.add_argument('--window-size=1920x1080')
    options.add_argument('--no-sandbox')
    options.binary_location='/opt/google/chrome/google-chrome'
    options.add_argument('--disable-dev-shm-usage')
    options.binary_location=CHROME_EXE_DRIVER_PATH
    # 配置到实例 chromedriver路径不能写在options里面，否则会找不到
    if (platform.system() == 'Windows'): 
        browser = webdriver.Chrome(chrome_options=options)
    else:
        browser = webdriver.Chrome('/opt/google/chrome/chromedriver',chrome_options=options)
    cc = browser.get("http://www.baidu.com")
    #text = pytesseract.image_to_string('./123.png')
    return '1234'



if __name__ == '__main__':
    app.run(host='0.0.0.0',port='5000')
    #test()
