#!/bin/sh -e
install -D -m0644 awk/wscanparse.awk /var/lib/wifish/wscanparse.awk
install -D -m0644 awk/wlistparse.awk /var/lib/wifish/wlistparse.awk
install -D -m0644 awk/iwparse.awk /var/lib/wifish/iwparse.awk
install -D -m0755 wifish /usr/local/bin
echo "Wifish is installed"
