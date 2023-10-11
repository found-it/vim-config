#!/bin/bash
#
# Install Fish configuration
#

# Grab logger base functions
if test -f ../common/logger.sh; then
  source ../common/logger.sh
  FISH_CONFIG="${PWD}/config.fish"
elif test -f common/logger.sh; then
  source common/logger.sh
  FISH_CONFIG="${PWD}/fish/config.fish"
else
  printf "ERROR: Cannot find logger.sh"
  exit 1
fi

APP="fish"
CONFIG_PATH="${HOME}/.config/fish/config.fish"

function info() {
  info_base "${APP}" "${1}"
}
function warn() {
  warn_base "${APP}" "${1}"
}
function error() {
  error_base "${APP}" "${1}"
}

function check() {
  config_path="${1}"
  info "Checking if safe to configure"
  if test -f "${config_path}"; then
    warn "${config_path} already exists"
    return 1
  fi
  info "Safe to create ${config_path}"
  return 0
}

function install() {
  check "${CONFIG_PATH}"
  status=$?

  if test $force; then
    warn "Ignoring check output and forcing install"
    status=0
  fi

  if test $status -eq 1; then
    error "Not installing"
    exit 1
  fi
  info "Installing config"
  mkdir -p "${HOME}/.config/fish"
  ln -sf "${FISH_CONFIG}" "${CONFIG_PATH}"
}

install
