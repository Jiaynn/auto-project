FROM nginx  
COPY dist/ /www/wwwroot/auto.com/ 
COPY default.conf /etc/nginx/conf.d/default.conf  