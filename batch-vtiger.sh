#!/bin/sh
umask 002

cd /home/acube/projects/fittedhomealarms/source

/usr/bin/php -q sync-opencart-vtiger.php
