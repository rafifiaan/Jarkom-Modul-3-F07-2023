# Pada node DHCP Server Himmel

apt-get update
apt-get install isc-dhcp-server -y
dhcpd --version

echo '
# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd'\''s config file (default: /etc/dhcp/dhcpd.conf).
#DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd'\''s PID file (default: /var/run/dhcpd.pid).
#DHCPDv4_PID=/var/run/dhcpd.pid
#DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#       Don'\''t use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACES="eth0"
' > /etc/default/isc-dhcp-server

echo '
subnet 10.55.1.0 netmask 255.255.255.0 {
}

subnet 10.55.2.0 netmask 255.255.255.0 {
}

subnet 10.55.3.0 netmask 255.255.255.0 {
    range 10.55.3.16 10.55.3.32; # range ip untuk client
    range 10.55.3.64 10.55.3.80; # range ip untuk client
    option routers 10.55.3.0; # ip gateway switch3
    option broadcast-address 10.55.3.255; # mirip ip subnet dengan byte terakhir 255
    option domain-name-servers 10.55.1.2; # ip dns server
    default-lease-time 180; # 3 menit
    max-lease-time 5760; # 96 menit
}
subnet 10.55.4.0 netmask 255.255.255.0 {
    range 10.55.4.12 10.55.4.20;   # range ip untuk client
    range 10.55.4.160 10.55.4.168; # range ip untuk client
    option routers 10.55.4.0; # ip gateway switch4
    option broadcast-address 10.55.4.255; # mirip ip subnet dengan byte terakhir 255
    option domain-name-servers 10.55.1.2; # ip dns server
    default-lease-time 720; # 12 menit
    max-lease-time 5760; # 96 menit
}
' > /etc/dhcp/dhcpd.conf


service isc-dhcp-server restart


