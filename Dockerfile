# Version
FROM debian:buster

# Createur
MAINTAINER Safernan <safernan@student.42.fr>

# Mise a jour
RUN apt-get update \
	&& apt-get upgrade -y 

# Telechargement et installations des paquets 
RUN apt-get install wget nginx mariadb-server php7.3-fpm php7.3-mysql -y

# Copie des fichier sur Docker
COPY /srcs/* var/www/

# Donne les droits au script
RUN chmod +x /var/www/script.sh

# Execute le script sur Docker
CMD bash /var/www/script.sh

# Partage des ports avec l'exterieur
EXPOSE 80
EXPOSE 443

