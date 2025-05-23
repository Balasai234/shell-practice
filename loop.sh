#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
echo -e "$Rv ERROR:: Please run this script with root access $N"
exit 1 #give other than 0 upto 127
echo  "You are running with root access"
fi

#validate functions takes input as exit status, what command they tried to install
Validate(){
    if [ $1 -eq 0 ]
    then
    echo -e " Installing $2 is ... $G SUCCESS $N"
    else
    echo -e "Installing $2 is ... $N"
    exit 1
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then 
echo "MySQL is not installed ... going to install it $N"
dnf install mysql -y
Validate $? "mySql"
else
echo -e "Nothing to do MySQL... $Y already installed $N"
fi
dnf list installed python3
if [ $? -ne 0 ]
then
echo "Python is not installed ... $Ggoing to install it $N"
dnf install python3 -y
Validate $? "python3"
else
echo -e "Nothing to do Python3.... $Y already installed $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
echo "Nginx is not installed ....  going to install it "
dnf install nginx -y
Validate $? "nginx"
else
echo -e "Nothing to do nginx .... $Y already installed $N"
fi
