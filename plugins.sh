cdplug_builtincd(){
    builtin cd $CHAIN_ORIGINAL_PARAMETERS
}
cdplug_virtualenv(){
    CHAIN_NEXT
    if [[ -z "$VIRTUAL_ENV" ]] ; then
        if [[ -d ./.env ]] ; then
            source ./.env/bin/activate
        fi
    else
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]] ; then
            deactivate
        fi
    fi
}
cdplug_makedirectory(){
    if ! [[ -d $CHAIN_ORIGINAL_PARAMETERS ]]
    then
        echo -n "this folder doesn't exist, do you want to create?[y/N]: "
        read answer
        case "$answer" in
            y)
                mkdir -p $CHAIN_ORIGINAL_PARAMETERS
                CHAIN_NEXT
                ;;
            yes)
                mkdir -p $CHAIN_ORIGINAL_PARAMETERS
                CHAIN_NEXT
                ;;
            *)

                ;;
        esac
    fi
}
cdplug_trigger(){
CHAIN_NEXT
if [[ $(ls -al | wc -l) == 3 ]];then
    echo "looks like this folder is empty do you want to trigger a script\n(your scripts under the $HOME/.triggerscripts)"
    if ! [[ -d $HOME/.triggerscripts ]];
    then
        mkdir $HOME/.triggerscripts
    fi
    let i=1
    for s in $(ls $HOME/.triggerscripts);do
        echo $i': '$s;
    done

fi
}
