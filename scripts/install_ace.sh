#!/bin/bash

echo "Installing ABO"

type nginx
[[ $? -ne 0 ]] && { echo "Nginx seems to be not installed"; exit 1; }
ls -ltr /var/www/html >/dev/null
[[ $? -ne 0 ]] && { echo "Apache directory is missing"; exit 1; }

[[ -z $UPLOAD_DIRECTORY ]] && { echo "UPLOAD_DIRECTORY not set"; exit 1; }
[[ -z $REQUEST_DIRECTORY ]] && { echo "REQUEST_DIRECTORY not set"; exit 1; }

echo ">> Checking if UPLOAD_DIRECTORY exists: $UPLOAD_DIRECTORY"
if [[ ! -d $UPLOAD_DIRECTORY ]]; then
	mkdir -p $UPLOAD_DIRECTORY
fi
echo ">> Checking if REQUEST_DIRECTORY exists: $REQUEST_DIRECTORY"
if [[ ! -d $REQUEST_DIRECTORY ]]; then
	mkdir -p $REQUEST_DIRECTORY
fi

echo ">> Sourcing external IP"
if [[ -z $ACE_EXTERNAL_IP_ADDRESS ]]; then
	echo -e "No External IP set. Please provide a valid IP address: %c"
	read ACE_EXTERNAL_IP_ADDRESS
fi

ACEAPIDIR=/usr/pkg/aceapi

echo ">> Checkout repositories"
if [[ ! -d /usr/pkg/aceapi ]]; then
	mkdir -p /usr/pkg
	cd /usr/pkg
	git clone https://github.com/seogeekk/aceapi.git
fi

echo ">> Updating aceapi"
cd $ACEAPIDIR
git pull
if [[ $? -ne 0 ]]; then
	git stash
	git pull
	[[ $? -ne 0 ]] && { echo "Error: Failed Updating aceapi"; exit 1; }
fi
echo ">> Run npm install"
npm install
if [[ $? -ne 0 ]]; then
	echo "Error: Failed node packages update"
	exit 1
fi

echo ">> Run replace of external address"
replacehost.pl $ACE_EXTERNAL_IP_ADDRESS
[[ $? -ne 0 ]] && { echo "Error: Failed replacing $ACE_EXTERNAL_IP_ADDRESS"; exit 1; }

echo ">> Check for localhost references"
grep localhost /usr/pkg/aceapi/routes/handlers/*.js


echo ">> Start pm2"
pm2 info aceapi >/dev/null
if [[ $? -eq 0 ]]; then
	pm2 restart aceapi --update-env
else 
	cd $ACEAPIDIR
	pm2 start ./bin/www --name aceapi --update-env
fi

echo ">> Restart Nginx"
service nginx restart
[[ $? -ne 0 ]] && { echo "Error: Nginx restart failed"; exit 1; }

echo
echo "*****************" 
echo "ABO install done."
echo "*****************" 