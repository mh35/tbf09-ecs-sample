#!/bin/bash

set -e

rm -f /diary/tmp/pids/server.pid

exec "$@"
