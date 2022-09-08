#!/bin/bash

export CONFLUENCE_URL="https://webarchive.jira.com/wiki/"

# won't work for all users...
export CONFLUENCE_USER=`whoami`
export CONFLUENCE_PASSWORD=`pass archive/webarchive.jira.com | head -n1`
CONFLUENCE_SPACEID="~$CONFLUENCE_USER"

# TODO: check for variable errors here...

./divergence \
    --space-key $CONFLUENCE_SPACEID \
    -vvv \
    --toc \
    Brozzler_Docs.md Brozzler_Meta.md
