#!/bin/bash

disable_firewall() {
curl --location --request POST "https://api.upcloud.com/1.2/server/${UPCLOUD_SERVER_UUID}/firewall_rule" \
--header "Authorization: Basic ${UPCLOUD_BASIC_AUTH}" \
--header 'Content-Type: application/json' \
--data-raw '{
  "firewall_rule": {
    "position": "1",
    "direction": "in",
    "family": "IPv4",
    "protocol": "tcp",
    "destination_port_start": "80",
    "destination_port_end": "80",
    "action": "accept",
    "comment": "80 from ALL"
  }
}'
}

enable_firewall() {
curl --location --request DELETE "https://api.upcloud.com/1.2/server/${UPCLOUD_SERVER_UUID}/firewall_rule/1" \
--header "Authorization: Basic ${UPCLOUD_BASIC_AUTH}" \
--header 'Content-Type: application/json'
}