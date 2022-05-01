#!/bin/bash
# Based on this SO answer: https://unix.stackexchange.com/a/136898/227191

echo What is the title of this key?
read title
echo ""

echo Paste your Access token here:
read token
echo ""

ssh_key=$(cat ~/.ssh/id_rsa.pub)

curl -H "Authorization: token $token" \
    --data "{\"title\": \"$title\", \"key\": \"$ssh_key\"}" \
    https://api.github.com/user/keys

