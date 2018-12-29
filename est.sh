est silent activate chain

source $esthelpers_cdplug/plugins.sh

chain flush

chain plug cdplug_builtincd
chain plug cdplug_virtualenv
chain plug cdplug_makedirectory

chain save cdplug
cd(){
    chain exec cdplug $@
}
