FROM nurzhanme/sharpmaid
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
