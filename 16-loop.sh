#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FILE=/var/log/shellscripts-logs"
SCRIPT_NAME=$(echo $0 | cut -d '.' f1)
LOG_FILE="$LOG_FILE/$SCRIPT_NAME"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOG_FILE
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID  -eq 0 ]
then
echo -e "You are running  with root access" | tee -a $LOG_FILE
else
echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
exit 1
fi
VALIDATE(){
if [ $1 -eq 0 ]
then
echo -e "Installing $2 is... $G SUCCESS $N" | tee -a $LOG_FILE
else
echo -e "Installing $2 is....$R FAILURE $N" | tee -a $LOG_FILE
exit 1
fi
}
#for package in ${PACKAGES[@]}
for Packages in $@
do
dnf list installed $package &>>LOG_FILE
if [ $? -ne 0 ]
then
echo "$package is not installed...going to install it" | tee -a $LOG_FILE
dnf install $package -y &>>LOG_FILE
VALIDATE #? "$package"
else
echo -e "Nothing to do $package... $Y already installed $N" | tee -a $LOG_FILE
fi
done