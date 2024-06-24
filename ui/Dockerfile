# FROM nginx:1.21.6-alpine
#
# RUN rm -rf /usr/share/nginx/html/*
#
# COPY . /usr/share/nginx/html
# COPY ./nginx.conf /etc/nginx/nginx.conf
#
# EXPOSE 80
#
# HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1
#
# CMD ["nginx", "-g", "daemon off;"]



FROM nginx:1.21.6-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY . /usr/share/nginx/html
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80

# HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1

CMD ["/start.sh"]
