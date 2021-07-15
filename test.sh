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
cat /proc/cpuinfo | grep MHz
echo ''
}

cpu_architecture()
{
echo ''
echo "The CPU Architectute :"
lscpu >> b.txt | cat b.txt | sed -n 1p
}

os_version
kernel_version
cpu_clock_speed
cpu_architecture



