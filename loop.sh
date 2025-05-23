#!/bin/bash

R="\e[30m"
G="\e[31m"
Y="\e[32m"
N="\e[0
UserId= $(id -u)
if [ $UserId ne 0 ]
then 
echo -e "$R ERROR: you don't have a root access $N"
exit 1
else
echo "you are running with root access, continue.."
fi