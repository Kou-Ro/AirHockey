#!/bin/bash

target="$(cd "$(dirname "${0}")" && pwd)"

source "${target}/.env"

ssh -i "${KEY}" "${USER}@${HOST}" "rm -rf ~/build/*; rm -rf ~/build/.*"
scp -r -i "${KEY}" "${target}/../build" "${USER}@${HOST}:~/"