#!/bin/bash
exe=`dmenu_path | dmenu_run -nb '#000000' -nf '#FFFFFF' -sb '#FFFFFF' -sf '#000000'` && eval "exec $exe"
