builtincd(){
    builtin cd $CHAIN_ORIGINAL_PARAMETERS
}
virtualenv(){
    CHAIN_NEXT
    if [[ -z "$VIRTUAL_ENV" ]] ; then
        ## If env folder is found then activate the vitualenv
        if [[ -d ./.env ]] ; then
            source ./.env/bin/activate
        fi
    else
        ## check the current folder belong to earlier VIRTUAL_ENV folder
        # if yes then do nothing
        # else deactivate
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]] ; then
            deactivate
        fi
    fi
}
makedirectory(){
    if ! [[ -d $CHAIN_ORIGINAL_PARAMETERS ]]
    then
        echo -n "this folder doesn't exist, do you want to create?"
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
