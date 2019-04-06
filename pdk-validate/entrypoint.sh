#!/bin/sh

set -eu

pdk --version
pdk validate

exit $?