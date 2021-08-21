#!/usr/bin/env bash

OVPN_DIR="$HOME/vpn/"

echo "Sourcing VPN config files from $OVPN_DIR"

read -p "Specify username for the connections > " OVPN_UNAME
echo
read -p "Specify password for the connections > " OVPN_PASSWD
echo

declare -A OVPN_SECRETS
OVPN_SECRETS["password"]=$OVPN_PASSWD

OVPN_FILES=$(ls $OVPN_DIR)

for OVPN_FILE in $OVPN_FILES
do
  OVPN_CONNECTION_NAME=$(basename $OVPN_FILE .ovpn)
  echo "Adding $OVPN_FILE..."
  nmcli c import type openvpn file $OVPN_DIR$OVPN_FILE
  echo "Setting username and password for $OVPN_FILE..."
  nmcli c modify $OVPN_CONNECTION_NAME vpn.user-name $OVPN_UNAME
  nmcli c modify $OVPN_CONNECTION_NAME vpn.secrets $OVPN_SECRETS
  echo "Adding $OVPN_FILE IP addresses to UFW..."
  OVPN_DATA=$(nmcli c show $OVPN_CONNECTION_NAME | grep vpn.data)
  OVPN_SERVERS=$(
  nmcli c show $OVPN_CONNECTION_NAME |
    grep vpn.data |
    sed 's/.*remote = \(.*\), remote-cert-tls.*/\1/' |
    sed 's#:[[:digit:]]*\\, #\n#g' |
    sed 's#:[[:digit:]]*##g' |
    uniq
  )

  for OVPN_SERVER in $OVPN_SERVERS
  do
    echo "Adding $OVPN_SERVER IP addresses to UFW..."
    sudo ufw allow out from any to $OVPN_SERVER
  done

done

echo "Restarting UFW..."
sudo ufw reload

echo "All profiles successfully loaded and updated"
