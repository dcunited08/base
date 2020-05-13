FROM centos:7.5.1804

WORKDIR /root

RUN yum -y install epel-release wget dos2unix zip unzip && \
    yum -y install \
    php \
    php-mbstring \
    php-intl \
    php-xml \
    php-xmlrpc \
    php-pdo \
    php-mysqlnd \
    php-soap \
    php-gd \
    php-pear-Auth-SASL \
    php-pear-HTTP-Request \
    php-pear-Mail \
    php-pear-Mail-Mime \
    php-pear-Net-SMTP \
    php-pear-Net-Socket \
    php-pear-Net-URL \
    php-pear-Net-UserAgent-Detect \
    php-pecl-xdebug && \
    yum -y clean all && \
    bash -c "wget http://getcomposer.org/composer.phar && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer" && \
    mkdir /code && mkdir /code/build && mkdir /code/build/files

RUN rm -f /var/log/httpd/access_log && \
    rm -f /var/log/httpd/error_log && \
    rm -f /var/log/httpd/php_errors.log && \
    ln -s /dev/stdout /var/log/httpd/access_log && \
    ln -s /dev/stdout /var/log/httpd/error_log && \
    ln -s /dev/stderr /var/log/httpd/php_errors.log
