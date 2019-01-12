est silent activate chain
est silent activate wai
source $esthelpers_cdplug/plugins.sh
wai_source $esthelpers_cdplug/zshf/cdplug.zsh.sh
export _CDPLUG_VIRTUAL_PATH=""

chain cdplug:flush

chain cdplug:plug est_cdplug_builtincd
chain cdplug:plug est_cdplug_virtualenv
chain cdplug:plug est_cdplug_makedirectory
chain cdplug:plug est_cdplug_virtualpath
chain cdplug:plug est_cdplug_entrance

cd(){
    chain cdplug:exec $@
}

