yum install -y epel-release
yum install -y httpd php php-cli php-mysql php-gd php-mcrypt \
              gmp-devel php-gmp php-pdo php-xml php-pear-Log \
              php-pear-MDB2 php-pear-MDB2-Driver-mysql \
              java-1.7.0-openjdk java-1.7.0-openjdk-devel \
              mariadb-server mariadb cronie logrotate

yum install -y wget bzip2

wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2
cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/

wget https://github.com/ubccr/xdmod/releases/download/v6.6.0/xdmod-6.6.0-1.0.el7.centos.noarch.rpm
yum install -y xdmod-6.6.0-1.0.el7.centos.noarch.rpm

sed -i 's/^;date.timezone.*/date.timezone\=America\/New_York/' /etc/php.ini

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
mysql_secure_installation

/sbin/httpd -k start
