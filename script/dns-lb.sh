# Pada node DNS Server Heiter
# digunakan saat ada load balancer

apt-get update
apt-get install bind9 -y


# Isi dari /etc/bind/named.conf.local pada node DNS Server (Heiter)
echo '
zone "riegel.canyon.f07.com" {
        type master;
        file "/etc/bind/jarkom/riegel.canyon.f07.com";
};

zone "granz.channel.f07.com" {
        type master;
        file "/etc/bind/jarkom/granz.channel.f07.com";
};

' > /etc/bind/named.conf.local


mkdir /etc/bind/jarkom


# Isi dari /etc/bind/jarkom/riegel.canyon.f07.com
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.f07.com. root.riegel.canyon.f07.com. (
			2023111401    ; Serial
                        604800        ; Refresh
                        86400         ; Retry
                        2419200       ; Expire
                        604800 )      ; Negative Cache TTL
;
@               IN      NS      riegel.canyon.f07.com.
@               IN      A       10.55.4.1 ; IP Frieren
www             IN      CNAME   riegel.canyon.f07.com.
' > /etc/bind/jarkom/riegel.canyon.f07.com



# Isi dari /etc/bind/jarkom/granz.channel.f07.com
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.f07.com. root.granz.channel.f07.com. (
		        2023111401    ; Serial
                        604800        ; Refresh
                        86400         ; Retry
                        2419200       ; Expire
                        604800 )      ; Negative Cache TTL
;
@               IN      NS      granz.channel.f07.com.
@               IN      A       10.55.2.2 ; IP Load Balancer Eisen
www             IN      CNAME   granz.channel.f07.com.
' > /etc/bind/jarkom/granz.channel.f07.com

service bind9 restart
