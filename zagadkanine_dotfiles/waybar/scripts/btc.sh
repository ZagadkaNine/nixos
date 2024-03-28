#!/bin/sh
curl -s "https://api.binance.com/api/v3/avgPrice?symbol=BTCUSDT" | jq '.price' | bc | awk '{ printf("%.0f", $1) }'


