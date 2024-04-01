#!/bin/bash
# Based on this SO answer: https://unix.stackexchange.com/a/136898/227191

echo What is the title of this key?
read title
echo ""

echo Paste your Access token here:
read token
echo ""

RSA_KEY=~/.ssh/id_rsa.pub
ED25519_KEY=~/.ssh/id_ed25519.pub

ssh_key=""

if [ -f $RSA_KEY ]; then
    ssh_key=$(cat $RSA_KEY)
elif [ -f $ED25519_KEY ]; then
    ssh_key=$(cat $ED25519_KEY)
else
    echo "No public key found."
    exit
fi

curl -H "Authorization: token $token" \
    --data "{\"title\": \"$title\", \"key\": \"$ssh_key\"}" \
    https://api.github.com/user/keys

