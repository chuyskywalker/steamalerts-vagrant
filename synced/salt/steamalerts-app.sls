include:
 - nginx

steamalerts-app:
  git.latest:
    - name: git@bitbucket.org:chuyskywalker/steamalerts.com.git
    - rev: master
    - target: /www/steamalerts.com
    - require:
      - file.directory: www-dir
      - ssh_known_hosts: bitbucket-knownhosts
      - file.managed: ssh-source
      - file.managed: ssh-bb-key

www-dir:
  file.directory:
    - name: /www
    - user: nginx
    - group: nginx
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - pkg: nginx

bitbucket-knownhosts:
  ssh_known_hosts:
    - name: bitbucket.org
    - present
    - user: root
    - fingerprint: 97:8c:1b:f2:6f:14:6b:5c:3b:ec:aa:46:46:74:7c:40

ssh-source:
  file.managed:
    - name: /root/.ssh/config
    - source: salt://../files/ssh/config
    - mode: '0600'
    - user: root
    - group: root

ssh-bb-key:
  file.managed:
    - name: /root/.ssh/bb-deploy
    - source: salt://../files/ssh/bb-deploy
    - mode: '0600'
    - user: root
    - group: root

