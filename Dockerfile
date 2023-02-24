FROM alpine:latest

RUN apk add --no-cache curl

RUN curl -L -H "Cache-Control: no-cache" -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
 && mkdir -p /usr/local/bin/xray \
 && unzip /tmp/xray.zip -d /usr/local/bin/xray \
 && rm -f /tmp/xray.zip \
 && chmod +x /usr/local/bin/xray/xray

CMD ["/usr/local/bin/xray/xray", "run", "-config", "/usr/local/bin/xray/config.json"]
