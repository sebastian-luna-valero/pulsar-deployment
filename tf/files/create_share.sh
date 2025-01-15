#!/bin/bash

mkfs -t xfs /dev/sdb
echo "/dev/sdb  /data/share xfs defaults,nofail 0 2" >> /etc/fstab
mount /data/share
mkdir -p /data/share
chown pulsar:pulsar -R /data/share
