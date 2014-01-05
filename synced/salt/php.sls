include:
 - remi-repo

php:
  pkg.installed:
    - name: php
    - require:
      - pkgrepo: remi-php55
    - pkgs:
      - php
      - php-fpm
      - php-cli
      - php-mysqlnd
      - php-pdo
      - php-mcrypt
  service:
    - name: php-fpm
    - running
    - enable: True