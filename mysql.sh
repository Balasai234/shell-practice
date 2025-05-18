#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "You are not running with root user access.."
exit 1
else
echo "You are running with root user access"
fi
dnf  list installed mysql
if [ $? -ne 0 ]
then
echo "MySQL is not installed...going to install"
dnf install mysql -y
if [ $? -eq 0]
then 
echo "package is  install"
else
echo "package is not install"
exit 1
fi
else
echo "MySQL is already installed...Nothing to do"
fi
