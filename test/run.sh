#!/bin/bash -ex

WEB_HOST=${1:-localhost}

cd $(dirname $0)

venv=venv3
if ! [[ -d $venv ]]; then
    python3 -m virtualenv -p python3 $venv
fi

source $venv/bin/activate
pip3 install -r requirements.txt
robot --variable WEB_HOST:$WEB_HOST test.robot
