#!/usr/bin/env bash

for VPN_CONNECTION in $(nmcli c | grep .udp | cut -d ' ' -f 1)
do
  echo "Deleting $VPN_CONNECTION..."

  OVPN_SERVERS=$(
  nmcli c show $VPN_CONNECTION |
    grep vpn.data |
    sed 's/.*remote = \(.*\), remote-cert-tls.*/\1/' |
    sed 's#:[[:digit:]]*\\, #\n#g' |
    sed 's#:[[:digit:]]*##g' |
    uniq
  )

  for OVPN_SERVER in $OVPN_SERVERS
  do
    echo "Removing the corresponding UFW rule for $OVPN_SERVER ..."
    sudo ufw delete allow out from any to $OVPN_SERVER
  done

  echo "Deleting $VPN_CONNECTION from nmcli..."
  nmcli c delete $VPN_CONNECTION

done

echo "Restarting UFW..."
sudo ufw reload
