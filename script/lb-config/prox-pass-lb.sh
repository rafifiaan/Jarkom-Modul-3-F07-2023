# Pada node Load Balancer Eisen
# untuk keperluan proxy passing ke its.ac.id (sudah termasuk autentikasi)

echo '
 upstream myweb  {
        server 10.55.3.1; #IP Lawine
        server 10.55.3.2; #IP Linie
        server 10.55.3.3; #IP Lugner
 }

 server {
        listen 80;
        server_name granz.channel.f07.com;

        location / {
                proxy_pass http://myweb;
                auth_basic "Restricted Access";
                auth_basic_user_file /etc/nginx/rahasisakita/.htpasswd;
        }

        location ~* /its {
                proxy_pass https://www.its.ac.id;
        }

 }' > /etc/nginx/sites-available/lb-jarkom

unlink /etc/nginx/sites-enabled/lb-jarkom
ln -s /etc/nginx/sites-available/lb-jarkom /etc/nginx/sites-enabled
rm -rf /etc/nginx/sites-enabled/default

mkdir -p /etc/nginx/rahasisakita/
htpasswd -c -b /etc/nginx/rahasisakita/.htpasswd netics ajkf07

service nginx restart
nginx -t
