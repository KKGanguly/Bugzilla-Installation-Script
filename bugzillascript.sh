sudo apt-get install apache2 mysql-server-5.6 libappconfig-perl libdate-calc-perl libtemplate-perl libmime-perl build-essential libdatetime-timezone-perl libdatetime-perl libemail-sender-perl libemail-mime-perl libemail-mime-modifier-perl libdbi-perl libdbd-mysql-perl libcgi-pm-perl libmath-random-isaac-perl libmath-random-isaac-xs-perl apache2-mpm-prefork libapache2-mod-perl2 libapache2-mod-perl2-dev libchart-perl libxml-perl libxml-twig-perl perlmagick libgd-graph-perl libtemplate-plugin-gd-perl libsoap-lite-perl libhtml-scrubber-perl libjson-rpc-perl libdaemon-generic-perl libtheschwartz-perl libtest-taint-perl libauthen-radius-perl libfile-slurp-perl libencode-detect-perl libmodule-build-perl libnet-ldap-perl libauthen-sasl-perl libtemplate-perl-doc libfile-mimeinfo-perl libhtml-formattext-withlinks-perl libgd-dev lynx-cur python-sphinx
wget https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-4.4.6.tar.gz
tar -xvzf bugzilla-4.4.6.tar.gz
sudo mv bugzilla-4.4.6 /var/www/html/bugzilla
sudo chown -R www-data:www-data /var/www/html/bugzilla
mysql -u root -p < bug.sql
sudo cp -p /etc/mysql/my.cnf /etc/mysql/my.cnf.orig
sudo rm /etc/mysql/my.cnf
sudo cp my.cnf /etc/mysql/
sudo service mysql restart
sudo cp bugzilla.conf /etc/apache2/sites-available/
sudo a2enmod cgi headers expires rewrite
sudo a2ensite bugzilla
sudo a2dissite 000-default
sudo service apache2 restart
sudo /var/www/html/bugzilla/./checksetup.plud
sudo ls /root
cd /var/www/html/bugzilla
sudo /usr/bin/perl install-module.pl PatchReader
sudo /usr/bin/perl install-module.pl Email::Reply
sudo /usr/bin/perl install-module.pl Apache2::SizeLimit
sudo /usr/bin/perl install-module.pl DateTime::Locale
sudo /usr/bin/perl install-module.pl Email::Send
sudo /var/www/html/bugzilla/./checksetup.pl
sudo rm /var/www/html/bugzilla/localconfig
cd -
sudo cp localconfig /var/www/html/bugzilla
sudo /var/www/html/bugzilla/./checksetup.pl
sudo chmod +x exec.sh
./exec.sh
