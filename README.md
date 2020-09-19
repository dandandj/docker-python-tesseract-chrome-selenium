# docker-python-tesseract-chrome-selenium

## 基于centos python 镜像


通过dockerfile，自定义集成tesseract、selenium、chrome完成自动化操作以及ocr识别

## dockerfile说明
需要自行提前下好tesseract的chi_sim 和eng字体


此镜像基于docker的python3镜像

安装 tesseract 并且创建存放字体的目录
RUN yum -y install tesseract
RUN mkdir -p /usr/local/share/tesseract-ocr/tessdata

copy 下好的字体到ocr文件夹下，不然识别的时候会报找不到字体
#COPY ./eng.traineddata /usr/local/share/tesseract-ocr/tessdata/eng.traineddata
#COPY ./chi_sim.traineddata /usr/local/share/tesseract-ocr/tessdata/chi_sim.traineddata

运行中 yum 插件的加速源一直卡住，so ，使用了下面一行，通过sed命令行禁用了yum的加速插件
#RUN sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf

#### 需要注意的是这里，由于时间关系，最新版本可能会变动，所以需要自行替换下 chromedriver zip url地址
RUN yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
http://npm.taobao.org/mirrors/chromedriver/85.0.4183.38/chromedriver_linux64.zip


# DOWNLOAD 
链接: https://pan.baidu.com/s/1zp0ZjN9KmE_GrLUPV9z6PQ 提取码: xj19
