source $esthelpers_cdplug/plugins

chain plug builtincd
chain plug virtualenv
chain plug makedirectory






chain save cdplug
cd(){
    chain exec cdplug
}
