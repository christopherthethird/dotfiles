#!/bin/bash
PS1=''
PS1+='\[${__ps1_red}\]$(__ps1_failed_exit)'
PS1+='\[${__ps1_yellow}\] ''\[${__ps1_lightgreen}\]$ '
PS1+='\[${__ps1_blue}\]$(__git_ps1 "[%s]")'
PS1+='\[${__ps1_grey}\]\w'
PS1+='\[${__ps1_reset}\] '