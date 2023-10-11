GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

function base() {
  color="${1}"
  level="${2}"
  app="${3}"
  msg="${4}"

  printf "${color}[${level}] ${app}${NC} ${msg}\n"
}

function info_base() {
  color="${GREEN}"
  level="info"
  app="${1}"
  msg="${2}"

  base "${color}" "${level}" "${app}" "${msg}"
}

function warn_base() {
  color="${YELLOW}"
  level="warn"
  app="${1}"
  msg="${2}"

  base "${color}" "${level}" "${app}" "${msg}"
}

function error_base() {
  color="${RED}"
  level="erro"
  app="${1}"
  msg="${2}"

  base "${color}" "${level}" "${app}" "${msg}"
}

