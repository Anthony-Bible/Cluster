FROM php:7.4-fpm-alpine
RUN apk update && apk add python3 python3-dev git build-base libffi-dev openssl-dev openssl nginx rsync sed
RUN python3 -m venv /opt/aws-cliv2/env --prompt aws-cliv2
RUN source /opt/aws-cliv2/env/bin/activate

RUN pip3 install git+https://github.com/boto/botocore.git@v2 --upgrade
RUN pip3 install git+https://github.com/aws/aws-cli.git@v2 --upgrade

RUN test ! -f /usr/local/bin/aws && ln -s /opt/aws-cliv2/env/bin/aws /usr/local/bin/aws
RUN test ! -f /usr/local/bin/aws_bash_completer && ln -s /opt/aws-cliv2/env/bin/aws_bash_complete
RUN  openssl dhparam -out /etc/nginx/dhparam.pem 2048 

COPY --chown=82 registration/ /var/www/html
RUN mkdir /root/.aws
COPY .aws/ /root/.aws/

RUN echo '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' | base64 -d >  /etc/nginx/nginxconfig.io-anthonybible.com,anthony.bible,endixium.com,register.anthonybible.com,anthonybible.dev,abible.co.zip
RUN unzip -o /etc/nginx/nginxconfig.io-anthonybible.com,anthony.bible,endixium.com,register.anthonybible.com,anthonybible.dev,abible.co.zip -d /etc/nginx/
RUN rm /etc/nginx/nginxconfig.io-anthonybible.com,anthony.bible,endixium.com,register.anthonybible.com,anthonybible.dev,abible.co.zip 
RUN mkdir /etc/php

RUN echo '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' | base64 -d > /etc/php/fpm.zip

RUN unzip -o /etc/php/fpm.zip -d /usr/local/etc/php-fpm.d 
RUN rm /etc/php/fpm.zip
