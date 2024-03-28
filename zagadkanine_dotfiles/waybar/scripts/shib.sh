#!/bin/sh
curl -s "https://api.binance.com/api/v3/avgPrice?symbol=SHIBUSDT" | jq '.price' | bc

