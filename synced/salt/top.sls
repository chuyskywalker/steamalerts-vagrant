base:
  '*':
    - iptables-off
    - nginx
    - php
{#
    Herein, with a proper state file, I might skip this
    based on a grain of AWS vs Virtualbox because the
    AWS instance will use RDS instead.
#}
    - mysql
    - steamalerts-app