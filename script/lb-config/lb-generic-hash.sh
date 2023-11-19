# Pada node Load Balancer Eisen
# Generic Hash

echo '
 upstream myweb  {
        hash $request_uri consistent;
        server 10.55.3.1; #IP Lawine
        server 10.55.3.2; #IP Linie
        server 10.55.3.3; #IP Lugner
 }

 server {
        listen 80;
        server_name granz.channel.f07.com;

        location / {
        proxy_pass http://myweb;
        proxy_set_header    X-Real-IP $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header    Host $http_host;
        }
 }' > /etc/nginx/sites-available/lb-jarkom

unlink /etc/nginx/sites-enabled/lb-jarkom
ln -s /etc/nginx/sites-available/lb-jarkom /etc/nginx/sites-enabled
rm -rf /etc/nginx/sites-enabled/default

service nginx restart
nginx -t
