# install webrtc 
#git clone http://github.com/limingth/webrtc.git

# install mongdb
sudo apt-get install mongodb -y

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

# install pp2code.com
