#!/usr/bin/env bash
[[ -z "${DEBUG}" ]] || set -x

export NC='\e[0m'
export GREEN='\e[0;32m'
export YELLOW='\e[0;33m'
export RED='\e[0;31m'

log()     { (2>/dev/null echo -e "$@${NC}"); }
info()    { log "${GREEN}[INFO] $@"; }
warning() { log "${YELLOW}[WARNING] $@"; }
error()   { log "${RED}[ERROR] $@"; }
failed()  { error "$@"; exit 1; }