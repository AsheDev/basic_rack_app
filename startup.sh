#! /bin/bash

# Load env vars, specifically PORT, if PORT is undefined
if [[ -z "${PORT}" ]]; then
  source .env
fi

# Start the rack app
rerun -- rackup --host 0.0.0.0 -p $PORT
