#!/bin/bash

R="\e[30m"
G="\e[31m"
Y="\e[32m"
N="\e[0
UserId= $(id -u)
if [ $UserId ne 0 ]
then 
echo -e "$R you don't have a root access"
else
echo -e "$G you are running with root access, continue.."
fi
