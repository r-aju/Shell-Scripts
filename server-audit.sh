#!/bin/bash

echo "---------------------------------------------------"
echo "Hello Please find the Hardware Specifications Below"
echo "---------------------------------------------------"

os_version()
{
echo ''
echo "The OS Version is :"
lsb_release -a >> a.txt | cat a.txt | sed -n 2p
echo ''

}

kernel_version()
{
echo ''
echo "The Kernel Version is :"
kernel_version=`uname -r`
echo $kernel_version
}

cpu_clock_speed()
{
echo ''
echo "The CPU Clock Speed is :"
cat /proc/cpuinfo | sed -n 8p
echo ''

cpu_architecture()
{
echo ''
echo "The CPU Architectute :"
cpu_architecture=`lscpu | grep Architecture`
echo $cpu_architecture
echo ''
}

ram_details()
{
echo ''
echo "RAM_Details"
cat /proc/meminfo | grep -E 'MemTotal|MemFree|MemAvailable'
echo ''
}

disk_details()
{
echo ''
echo "Mounted partition"
echo ''
blkid -c /dev/nul | awk -F: '{print $1}'
echo ''
echo "Unmounted Partition"
lsblk  --noheadings --raw | awk '{print substr($0,0,4)}' | uniq -c | grep 1 | awk '{print "/dev/"$2}'
echo ''
}

physical_cpu_cores()
{
echo ''
echo "Physical and Virtual CPU Cores"
phy_cores=`grep "physical id" /proc/cpuinfo | sort | uniq | wc -l`
vir_cores=`grep "^processor" /proc/cpuinfo | wc -l`
echo "The Ratio is"
echo $vir_cores ":" $phy_cores
echo ''
}

network_ports()
{
echo ''
echo "The list of active protocols and ports are"
netstat -tulpn | awk '{print $1,$4}'
echo ''
}

os_firewalls()
{
echo ''
cat /etc/services| grep -E 'tcp|udp'
echo ''
}

network_bandwidth()
{
echo ''
echo "Networking Bandwidth"
bwm-ng -o csv -c 6 -T rate -I etho,enp0s3
echo ''
}

echo "---------------------------------------------------"


echo "---------------------------------------------------"
os_version

echo "---------------------------------------------------"
kernel_version

echo "---------------------------------------------------"
cpu_clock_speed

echo "---------------------------------------------------"
cpu_architecture

echo "---------------------------------------------------"
ram_details

echo "---------------------------------------------------"
disk_details

echo "---------------------------------------------------"
physical_cpu_cores

echo "---------------------------------------------------"
network_ports

echo "---------------------------------------------------"
os_firewalls

echo "---------------------------------------------------"
network_bandwidth

echo "---------------------------------------------------"

