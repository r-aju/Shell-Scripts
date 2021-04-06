#! /bin/bash

echo ">>> Installing Erlang"
apt-key adv --keyserver "hkps.pool.sks-keyservers.net" --recv-keys "0x6B73A36E6026DFCA"
wget -O - "https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc" | sudo apt-key add -

erlang_deb=erlang-solutions_1.0_all.deb
wget https://packages.erlang-solutions.com/"$erlang_deb"
sudo dpkg -i "$erlang_deb"
sudo apt-get update
sudo apt-get -y install erlang erlang-nox socat
rm "$erlang_deb"

echo ">>> Installing RabbitMQ"
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
rabbit_deb=rabbitmq-server_3.7.10-1_all.deb
wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.10/"$rabbit_deb"
sudo dpkg -i "$rabbit_deb"
sudo apt-get -f install -y
rm "$rabbit_deb"

sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server


echo ">>> Create Admin User in RabbitMQ"
sudo rabbitmqctl add_user admin pass
sudo rabbitmqctl set_user_tags admin administrator
sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"

echo ">>> Enable the RabbitMQ Management Dashboard"
sudo rabbitmq-plugins enable rabbitmq_management
