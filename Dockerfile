## Always use the latest CentOS 7 so we get patches
FROM centos:7

WORKDIR /root
RUN yum -y install epel-release wget dos2unix zip unzip yum-utils && \
    yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php73 && \
    yum -y install php php-cli php-xml php-xmlrpc php-gd php-soap php-mcrypt php-mbstring php-intl php-mysqlnd php-pdo \
    php-pear-Mail-Mime php-pear-Net-SMTP php-pear-Net-Socket php-pear-Net-URL php-pear-Net-UserAgent-Detect php-pecl-xdebug && \
    yum -y clean all && \
    bash -c "wget http://getcomposer.org/composer.phar && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer" && \
    mkdir /code && rm -f /etc/php.d/15-xdebug.ini

RUN rm -f /var/log/httpd/access_log && \
    rm -f /var/log/httpd/error_log && \
    ln -s /dev/stdout /var/log/httpd/access_log && \
    ln -s /dev/stderr /var/log/httpd/error_log
