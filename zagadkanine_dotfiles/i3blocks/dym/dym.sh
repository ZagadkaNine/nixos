#!/bin/sh
curl -s "https://api.binance.com/api/v3/avgPrice?symbol=DYMUSDT" | jq '.price' | bc | awk '{ printf("DYM/USDT %s\n"), $1 }'


