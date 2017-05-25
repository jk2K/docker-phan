FROM composer:latest

RUN apk add --no-cache git \
    && git clone https://github.com/nikic/php-ast.git /tmp/php-ast \
    && apk del git \
    && docker-php-ext-configure /tmp/php-ast \
    && docker-php-ext-install /tmp/php-ast \
    && rm -r /tmp/php-ast \
    && composer create-project --no-dev --prefer-dist etsy/phan /opt/phan 0.9.1

ENV PATH $PATH:/opt/phan/

CMD ["phan"]
