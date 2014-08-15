# install webrtc 
#git clone http://github.com/limingth/webrtc.git

# install mongdb
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
sudo apt-get install mongodb -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install mongodb-org -y

# install rabbitmq-server
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc
apt-get update
sudo apt-get install rabbitmq-server -y

# install setuptools for python
wget "https://bitbucket.org/pypa/setuptools/get/default.tar.gz#egg=setuptools-dev" --no-check-certificate
tar -xzvf default.tar.gz
cd pypa-setuptools-9616be97e6a7/
sudo python setup.py install

# start gateone service
# sudo vi /etc/gateone/conf.d/10server.conf    
# "origins": ["localhost", "127.0.0.1", "AY140703094435557aacZ", "10.171.27.1", "182.92.160.153"],
sudo service gateone restart 
# visit https://ip:443 to login

# install Gateone
git clone https://github.com/liftoff/GateOne.git
cd GateOne
python setup.py install

# install java7 (java version "1.7.0_60")
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
java -version

# install elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.deb
sudo dpkg -i elasticsearch-1.1.1.deb
# start elasticsearch service 
sudo service elasticsearch restart
curl -XGET 'http://localhost:9200'
# creating the index
bundle exec rake environment elasticsearch:import:model CLASS='User' FORCE=true

# install mysql2 on ubuntu
sudo apt-get install mysql-server
sudo apt-get install mysql-client
sudo apt-get install libmysql++-dev
gem install mysql2

# mysql error -> Access denied for user 'root'@'localhost' (using password: NO).
/etc/init.d/mysql stop
mysqld_safe --user=mysql --skip-grant-tables --skip-networking &
mysql -u root mysql
mysql> UPDATE user SET Password=PASSWORD('newpassword') where USER='root';
mysql> FLUSH PRIVILEGES;
mysql> quit
/etc/init.d/mysql restart
mysql -uroot -p
Enter password: <输入新设的密码newpassword>
mysql> grant select,insert,update,delete on book.* to ubuntu@localhost Identified by "";

# modify config/database.yml
# username: root
# password: mysql-password
vi config/database.yml

# cp 2 yml file
cp config/database.yml.example config/database.yml
cp config/settings.yml.example config/settings.yml

# install mysql2 on mac
brew install mysql
brew install ruby2.1.2
gem install mysql2

# find ppweb_development under /usr/local/var/mysql/ppweb_development/
# mysql -D ppweb_development

# mysql> show tables;

# install redis-server
sudo apt-get install redis-server
redis-server &

# cd ppweb and start rails server
bundle install
rake db:create
rake db:migrate

