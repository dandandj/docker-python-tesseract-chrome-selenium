FROM python3(基于python的镜像)

MAINTAINER jhao104 "my"

COPY ./requirements.txt /requirements.txt
RUN mkdir -p /usr/local/share/tesseract-ocr/tessdata
COPY ./eng.traineddata /usr/local/share/tesseract-ocr/tessdata/eng.traineddata
COPY ./chi_sim.traineddata /usr/local/share/tesseract-ocr/tessdata/chi_sim.traineddata
#复制字体文件
#COPY ./eng.traineddata /usr/local/share/tesseract-ocr/tessdata/eng.traineddata
#COPY ./chi_sim.traineddata /usr/local/share/tesseract-ocr/tessdata/chi_sim.traineddata
#COPY ./google.rpm /usr/local/google.rpm
#COPY ./chromedriver /usr/local/chromedriver

WORKDIR /

### 通过sed命令禁用掉yum加速源
#RUN sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf
RUN mkdir -p /usr/local/chromeexe/ 

##安装tesseract
RUN yum -y install tesseract

#安装chrome 浏览器
RUN yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm


RUN mkdir -p /usr/local/chromedriver/
## 下载chromedriver 
##  为什么最后要带上 || true  
## 猜想是 这个run没有返回任何参数，所以docker执行后会抛出 The command '/bin/sh -c wget -p http://unzip.com && unzip chromedriver_linux64.zip' returned a non-zero code: 1

RUN wget -p -O /usr/local/chromedriver_linux64.zip http://npm.taobao.org/mirrors/chromedriver/85.0.4183.38/chromedriver_linux64.zip && cd /usr/local/ && unzip chromedriver_linux64.zip && cp /usr/local/chromedriver /opt/google/chrome/ || true;

RUN pip3 install -r requirements.txt

#将前面的 yum禁用修改回来
#RUN sed -i 's/enabled=0/enabled=1/g' /etc/yum/pluginconf.d/fastestmirror.conf
COPY . /

#设置 tesseract 工作目录
ENV TESSDATA_PREFIX /usr/local/share/tesseract-ocr

ENTRYPOINT [ "python3" ]

CMD [ "app/app.py" ] 

