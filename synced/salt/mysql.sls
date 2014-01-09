include:
 - remi-repo

mysql:
  pkg.installed:
    - name: mysql-server
    - require:
      - pkgrepo: remi-php55
    - pkgs:
      - mysql
      - mysql-server
  service:
    - name: mysqld
    - running
    - enable: True
    - require:
      - pkg: mysql