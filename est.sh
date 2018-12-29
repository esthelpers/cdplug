est silent activate chain

source $esthelpers_cdplug/plugins.sh

chain cdplug:flush

chain cdplug:plug cdplug_builtincd
chain cdplug:plug cdplug_virtualenv
chain cdplug:plug cdplug_makedirectory

chain cdplug:save 
cd(){
    chain cdplug:exec $@
}
