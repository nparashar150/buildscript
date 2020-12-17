#!/bin/bash
echo "Welcome to my script."
echo "Run this script in the path where your file is located."
echo ""
echo ""
echo ""
sudo apt install ruby-full -y --ignore-missing 
sudo gem install rmega
echo "Enter your E-Mail ID"
read email
echo "Your email is $email"
echo "Listing the files in the Directory."
ls -a
echo "Enter the full Filename"
read file
echo "Enter the password of your mega account"
rmega-up "$file" -u "$email"
echo "Done Uploading the file you wanted to upload. xD"
echo "Follow me for more support: https://github.com/nparashar150"