FROM nginx:latest
ARG CODE_VERSION=${CODE_VERSION:-1.0}
RUN mkdir -p /usr/share/nginx/html/static
COPY src/ /usr/share/nginx/html/static
RUN sed -i 's/%VERSION%/'${CODE_VERSION}'/g' /usr/share/nginx/html/static/index.html
