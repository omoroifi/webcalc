#!/bin/bash -exu

host=$1
user=web

mkdir -p ~/.ssh
chmod 700 ~/.ssh
grep $host ~/.ssh/known_hosts || ssh-keyscan -H $host >> ~/.ssh/known_hosts
scp src/* $user@$host:
ssh $user@$host ./run.sh
