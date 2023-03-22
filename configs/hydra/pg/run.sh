#!/usr/bin/env bash

hydra -M /var/configs/pg/servers.txt -C /var/configs/pg/pwlist.txt postgres
