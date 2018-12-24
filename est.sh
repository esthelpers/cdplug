source $esthelpers_cdplug/plugins.sh

chain flush

chain plug builtincd
chain plug virtualenv
chain plug makedirectory

chain save cdplug
cd(){
    chain exec cdplug
}
