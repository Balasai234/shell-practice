#!/bin/bash

if [ -f "myfile.txt" ]; then
    echo "✅ File exists"
else
    echo "❌ File does not exist"
    exit 1
fi

echo "➡️ Script continues here"
