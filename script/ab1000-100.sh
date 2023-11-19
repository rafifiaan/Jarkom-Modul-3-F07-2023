# Pada node client (Sein, Stark, Revolte, Richter)
# untuk pengujian nomor 7 -> 1000 request dengan 100 request/second

apt-get update
apt-get install apache2-utils -y
ab -V
ab -n 1000 -c 100 http://10.55.2.2/
