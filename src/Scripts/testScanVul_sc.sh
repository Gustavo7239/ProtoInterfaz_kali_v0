sudo arp-scan --localnet -q -I eth0 | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -v -e "^$my_ip$" -e '\.254$' -e '\.1$' 