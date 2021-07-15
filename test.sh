
#!/bin/bash

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
uname -r
echo ''
}



cpu_clock_speed()
{
echo ''
echo "The CPU Clock Speed is :"
cat /proc/cpuinfo >> c.txt | cat c.txt | sed -n 8p
echo ''
}

cpu_architecture()
{
echo ''
echo "The CPU Architectute :"
lscpu | grep Architecture
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
echo "Disk_details"
lsblk
echo ''
}


physical_cpu_cores()
{
echo ''
echo "Physical CPU Cores"
cat /proc/cpuinfo | grep "cpu cores"
echo ''
}



os_version
kernel_version
cpu_clock_speed
cpu_architecture
ram_details
disk_details
physical_cpu_cores


