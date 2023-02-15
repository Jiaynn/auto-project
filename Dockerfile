# 设置基础镜像 
FROM daocloud.io/library/nginx:1.9.1
# 定义作者
MAINTAINER jiaynn
# 添加时区环境变量，亚洲，上海
ENV TimeZone=Asia/Shanghai
# 将dist文件中的内容复制到 /etc/nginx/html/ 这个目录下面
COPY dist/  /etc/nginx/html/
# 将配置文件中的内容复制到 /etc/nginx 这个目录下面(增加自己的代理及一些配置)
RUN rm -rf /etc/nginx/nginx.conf 
# 用本地的nginx配置文件覆盖镜像的Nginx配置
COPY nginx.conf /etc/nginx/nginx.conf
# 暴露端口
EXPOSE 80