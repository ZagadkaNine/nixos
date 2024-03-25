#!/bin/sh
curl -s "https://api.binance.com/api/v3/avgPrice?symbol=BTCEUR" | jq '.price' | bc | awk '{ printf("BTC/EUR %s\n"), $1 }'


