#!/bin/bash

function include() {
    [[ -f "${1}" ]] && . "${1}" >/dev/null 2>&1
}

export TERM=xterm-256color
[[ ! -z ${TMUX+x} ]] && export TERM=screen-256color

readonly __ps1_reset=$(tput sgr0)
readonly __ps1_red=$(
    tput bold
    tput setaf 196
)
readonly __ps1_grey=$(tput setaf 240)
readonly __ps1_yellow=$(
    tput bold
    tput setaf 3
)
readonly __ps1_lightgreen=$(tput setaf 34)
readonly __ps1_blue=$(
    tput bold
    tput setaf 6
)

function __ps1_failed_exit() {
    local rc="${?}"
    if (("${rc}" != 0)); then
        echo "[${rc}]"
    fi
}