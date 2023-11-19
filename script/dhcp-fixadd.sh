# Pada node DHCP Server Himmel
# untuk keperluan menetapkan host ip fixed address

echo '
subnet 10.55.1.0 netmask 255.255.255.0 {
}

subnet 10.55.2.0 netmask 255.255.255.0 {
}

subnet 10.55.3.0 netmask 255.255.255.0 {
        range 10.55.3.16 10.55.3.32;
        range 10.55.3.64 10.55.3.80;
        option routers 10.55.3.0;
        option broadcast-address 10.55.3.255;
        option domain-name-servers 10.55.1.2;
        default-lease-time 180;
        max-lease-time 5760;
}

subnet 10.55.4.0 netmask 255.255.255.0 {
        range 10.55.4.12 10.55.4.20;
        range 10.55.4.160 10.55.4.168;
        option routers 10.55.4.0;
        option broadcast-address 10.55.4.255;
        option domain-name-servers 10.55.1.2;
        default-lease-time 720;
        max-lease-time 5760;
}

host Revolte {
    # lakukan ip a pada client, lalu masukkan ke sini
    hardware ethernet [hwaddress terakhir];
	fixed-address 10.55.3.69;
}

host Ricther {
    # lakukan ip a pada client, lalu masukkan ke sini
    hardware ethernet [hwaddress terakhir];
	fixed-address 10.55.3.70;
}

host Sein {
    # lakukan ip a pada client, lalu masukkan ke sini
    hardware ethernet [hwaddress terakhir];
	fixed-address 10.55.4.167;
}

host Stark {
    # lakukan ip a pada client, lalu masukkan ke sini
    hardware ethernet [hwaddress terakhir];
	fixed-address 10.55.4.168;
}' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
