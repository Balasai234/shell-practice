#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
echo -e "$R Please run with Root access $N"
exit 1
else
echo -e "$G Please install the packages as you have root access $N"
fi
dnf list installed mysql
if [$? -ne 0 ]
then 
echo -e "$R package not found please install my sql if you required $N"
dnf install mysql -y