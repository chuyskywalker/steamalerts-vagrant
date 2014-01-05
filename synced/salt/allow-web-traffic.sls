# todo: uh, make exceptions in the default iptables
# kinda works, but the rule comes after the block so ultimately fails, ie:
#   Chain INPUT (policy ACCEPT)
#   num  target     prot opt source               destination
#   1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
#   2    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0
#   3    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
#   4    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22
#   5    REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited
#   6    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:80
# Close, but not quite right.

# might be better to just manage the iptables file itself and force a restart

allow-web-traffic:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 80
    - proto: tcp
#    - sport: 1025:65535
    - save: True