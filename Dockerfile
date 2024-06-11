# 使用CentOS作为基础镜像
FROM centos:latest

# 安装必要的工具
RUN yum update -y && \
    yum install -y wget unzip && \
    yum clean all

# 下载并安装JDK 8u201
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV PATH=$PATH:$JAVA_HOME/bin
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u201-b09/jdk-8u201-linux-x64.rpm" && \
    rpm -ivh jdk-8u201-linux-x64.rpm && \
    rm jdk-8u201-linux-x64.rpm && \
    ln -s $JAVA_HOME /usr/java

# 设置工作目录
WORKDIR /app

# 暴露端口（如果需要的话）
# EXPOSE <port>

# 定义默认命令（如果需要的话）
# CMD ["java", "-version"]
