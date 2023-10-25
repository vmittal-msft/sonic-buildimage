#!/bin/bash

switch_type=`sonic-db-cli CONFIG_DB  hget 'DEVICE_METADATA|localhost' 'switch_type'`
if [[$switch_type != 'voq']]; then
    sonic-cfggen -d -t /usr/share/sonic/templates/copp_cfg.j2 > /etc/sonic/copp_cfg.json
else
    sonic-cfggen -d -t /usr/share/sonic/templates/copp_cfg_chassis.j2 > /etc/sonic/copp_cfg.json
fi
