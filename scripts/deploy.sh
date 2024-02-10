#!/bin/bash

target="$(cd "$(dirname "${0}")" && pwd)"

source "${target}/.env"

/bin/processing-java "--force" "--sketch=${workspaceFolder}" "--output=${workspaceFolder}/build" "--export"

source "${target}/copy.sh"