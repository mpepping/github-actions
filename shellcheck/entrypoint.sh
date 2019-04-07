#!/bin/bash

echo ""
echo "Searching for shell scripts ..."
echo "-------------------------------"

find "$GITHUB_WORKSPACE" -name "*.sh" -print0 | xargs -n 1 -0 shellcheck -Cnever
