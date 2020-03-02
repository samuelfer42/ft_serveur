#!bin/bash

# demarage des services 
service nginx start
service php7.3-fpm start
service mysql start

# telecharge et extrait Wordpress
wget -c  https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www

# telecharge et extrait phpmyadmin
wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz -O - | tar -xz -C /var/www
mv /var/www/phpMyAdmin-4.9.2-english /var/www/phpmyadmin

# donne a l'utilisateur www-data le control total sur les repertoire Wordpress et PHPadmin
chown -R www-data: /var/www/wordpress
chown -R www-data: /var/www/phpmyadmin

# configuration nginx pour wordpress et phpmyadmin
cp /var/www/conf_nginx /etc/nginx/sites-available/conf_nginx
ln -s /etc/nginx/sites-available/conf_nginx /etc/nginx/sites-enabled/conf_nginx
rm /etc/nginx/sites-enabled/default

# Execution des commande pour la DB
mysql < /var/www/create_db.sql

# openssl 		= outil pour creer et gere les certifica
# req -x509 		= cree un certificats auto-signe
# -nodes 		= ignore l'option de securiser avec une phrase secrete
# -days 365 		= certificat valide pendant 1an
# -newkey rsa:2048	= generer un nouveau certificat et une nouvelle clef en meme temps
# -keyout 		= indique ou placer le fichier de clef privee 
# -out 			= indique ou placer le certificat

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < /var/www/certif


# redemarrage du service nginx
service nginx restart
