#!/bin/bash -ex

venv=venv3
if ! [[ -d $venv ]]; then
    python3 -m virtualenv -p python3 $venv
fi

source $venv/bin/activate
pip3 install -r requirements.txt
pkill -f webcalc.py || true
nohup python3 webcalc.py > out.log 2> err.log </dev/null &
disown
sleep 2
