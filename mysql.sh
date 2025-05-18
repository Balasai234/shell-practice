#!/bin/bash

USERID=$(id -u)
if [ $USERID -nq 0]
then
echo "You are not running with root user access.."
else
echo "You are running with root user access"