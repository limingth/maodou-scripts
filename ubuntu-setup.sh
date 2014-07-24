# wget 'raw path of setup-ubuntu.sh'
# . setup-ubuntu.sh

# modify PS1
echo export PS1=\"root@182.92.160.153 \\w\$ \" >> ~/.bashrc
. ~/.bashrc

# install curl
sudo apt-get install curl -y

# install git
sudo apt-get install git -y

# install vnc4server
sudo apt-get install vnc4server -y
vnc4server -kill :1
vnc4server -geometry 800x600 :1

# install guacamole
sudo apt-get update
sudo apt-get install guacamole -y
sudo apt-get install guacamole-tomcat -y
cat /etc/guacamole/user-mapping.xml 
sudo service tomcat6 restart
echo http://182.92.160.153:8080/guacamole/

# install noVNC
git clone https://github.com/kanaka/noVNC.git
cd noVNC && nohup ./utils/launch.sh --vnc localhost:5901 &
# http://182.92.71.188:6080/vnc_auto.html?host=182.92.71.188&port=6080&&password=maodou

# install shellinabox
git clone https://github.com/jayschwa/shellinabox.git
sudo apt-get install libtool
# $ aclocal
# $ autoconf 
cd shellinabox && ./configure && make 

# install chrome
sudo apt-get install chromium-browser -y

# install gedit
sudo apt-get install gedit -y

# install firefox
sudo apt-get install firefox -y

# install x-window
sudo apt-get install x-window-system-core -y

# after install gdm, every windows has a head panel
sudo apt-get install gdm -y

# without install ubuntu desktop, no Chinese fonts
sudo apt-get install ubuntu-desktop -y




