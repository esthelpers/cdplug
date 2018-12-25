builtincd(){
    builtin cd $CHAIN_ORIGINAL_PARAMETERS
}
virtualenv(){
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
makedirectory(){
    if ! [[ -d $CHAIN_ORIGINAL_PARAMETERS ]]
    then
        echo -n "this folder doesn't exist, do you want to create?[y/N]: "
        read answer
        case "$answer" in
            y)
                mkdir -p $CHAIN_ORIGINAL_PARAMETERS
                ;;
            yes)
                mkdir -p $CHAIN_ORIGINAL_PARAMETERS
                ;;
            *)
                ;;
        esac
    fi
    CHAIN_NEXT
}
