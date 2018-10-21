#!/bin/bash

# idea: 这是一款自动安装Python爬虫环境脚本,从Python3网络爬虫开发实战第一章爬虫环境写的自带脚本
# data: 2018-7-24 
# name: imorta
echo 
echo "***********************************************************************"
echo "************************请使用sudo运行该脚本否则将运行错误****************"
echo "***********************************************************************"
echo 
sudo apt update
echo  
echo "正在安装Python3!"
echo 
Python_jck="sudo apt-get install -y python3-dev build-essential libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev zlib1g-dev libcurl4-openssl-dev"
Python3="sudo apt-get install -y python3"
Python3_pip="sudo apt-get install -y python3-pip"


if $Python_jck
then
    echo "Python3预备环境安装完成"
    if $Python3
    then
        echo "Python3 安装完成"
    fi
    if $Python3_pip
    then
        echo "Python3_pip 安装完成"
    fi
    sudo rm -rf ~/.config/pip/
    sudo mkdir ~/.config/pip/
    sudo mv pip.conf ~/.config/pip/pip.conf
    pip3 install setuptools
    #pip3 install pipenv
    echo "Python3/pip/pypi环境配置已经完成"
fi

echo ""
echo ""
echo "安装Python爬虫库/数据库********************************"
tesserocr="sudo apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev"
## pip3 install tesserocr pillow
mysql="sudo apt-get install -y mysql-server mysql-client"
install_mongo="sudo apt-get install -y mongodb-server mongodb-client"
redis_server="sudo apt-get install -y redis-server"
Ruby="sudo apt-get install -y ruby-full"
RedisDump="sudo gem install redis-dump"
python_spide="pip3 install setuptools requests selenium aiodns lxml beautifulsoup4 pyquery pymysql pymongo redis flask tornado mitmproxy pyspider Scrapy scrapy-splash scrapy-redis scrapyd scrapyd-client python-scrapyd-api scrapyrt gerapy"
docker="curl -sSL https://get.daocloud.io/docker | sh"
docker_hello="sudo docker run hello-world"
if $tesserocr
then
    echo "teesserocr安装成功"
fi
if $mysql
then   
    echo "mysql安装成功"
fi
if $install_mongo
then   
        echo "mongodb安装成功"
fi
if $redis_server
then
    echo "redis安装成功"
    if $Ruby
    then
        echo "Ruby安装成功"
    fi
fi

if $python_spide
then
    echo "python-pip配置环境安装成功"
    echo "安装RedisDump"
    pip3 install pipenv
fi
if $RedisDump
then
    echo "RedisDump安装成功"
else
    echo "RedisDump安装失败"
fi
sudo apt install -y curl
if curl -sSL https://get.daocloud.io/docker | sh
then
    echo "Docker安装成功"
    $docker_hello
    echo "Docker run Hello Wolrd 成功"
fi