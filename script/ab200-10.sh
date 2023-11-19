# Pada node client (Sein, Stark, Revolte, Richter)
# untuk pengujian nomor 8 -> 200 request dengan 10 request/second
# dengan algoritma yang berbeda-beda

apt-get update
apt-get install apache2-utils -y
ab -V
ab -n 200 -c 10 http://10.55.2.2/
