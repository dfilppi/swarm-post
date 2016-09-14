#!/bin/bash

sudo docker swarm init --advertise-addr $IP

ctx instance runtime-properties master_token $(sudo docker swarm join-token -q manager)
ctx instance runtime-properties worker_token $(sudo docker swarm join-token -q worker)
