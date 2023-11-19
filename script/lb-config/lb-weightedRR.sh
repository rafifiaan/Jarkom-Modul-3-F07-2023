# Pada node Load Balancer Eisen
# Weighted Round Robin

echo '
 upstream myweb  {
        server 10.55.3.1 weight=4; #IP Lawine
        server 10.55.3.2 weight=2; #IP Linie
        server 10.55.3.3 weight=1; #IP Lugner
 }

 server {
        listen 80;
        server_name granz.channel.f07.com;

        location / {
        proxy_pass http://myweb;
        }
 }' > /etc/nginx/sites-available/lb-jarkom

unlink /etc/nginx/sites-enabled/lb-jarkom
ln -s /etc/nginx/sites-available/lb-jarkom /etc/nginx/sites-enabled
rm -rf /etc/nginx/sites-enabled/default

service nginx restart
nginx -t
