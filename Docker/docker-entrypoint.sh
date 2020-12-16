#!/bin/sh

if lsmod | grep "wireguard" &> /dev/null ; then
  echo "Module already loaded"
else
  modprobe "wireguard" && echo "Module Loaded"
fi

ip link add dev wg0 type wireguard
ip address add dev wg0 10.254.0.1/24

/usr/bin/wg setconf wg0 /etc/wireguard.conf
/usr/bin/wg set wg0 listen-port 51820

ip l set dev wg0 up
sysctl net.ipv4.ip_forward=1
iptables -A FORWARD -i wg0 -j ACCEPT
iptables -A FORWARD -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
