est_cdplug_builtincd(){
    builtin cd $CHAIN_ORIGINAL_PARAMETERS
}
est_cdplug_virtualenv(){
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
est_cdplug_makedirectory(){
    if ( ! [[ -d $CHAIN_ORIGINAL_PARAMETERS ]] ) && ( [[ $CHAIN_ORIGINAL_PARAMETERS != '~' ]] && [[ $CHAIN_ORIGINAL_PARAMETERS != '' ]] )
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
    else
        CHAIN_NEXT
    fi
}

est_cdplug_virtualpath(){
    if [[ -e $CHAIN_ORIGINAL_PARAMETERS ]];then
        CHAIN_NEXT
    else
        for virtual_path in $EST_CDPLUG_VIRTUAL_PATH;do
            for f in $(ls -d $virtual_path/*/);do
                if [[ $(basename $CHAIN_ORIGINAL_PARAMETERS) == $(basename $f) ]];then
                    CHAIN_ORIGINAL_PARAMETERS=$virtual_path/$(basename $f)
                    echo -e "\e[35m"$virtual_path"\e[0m"
                    br=1
                    break
                fi
            done
            if [[ br == 1 ]];then
                break
            fi
        done
        CHAIN_NEXT
    fi
}

est_cdplug_entrance(){
    if [[ -z $CHAIN_ORIGINAL_PARAMETERS ]];then
        if [[ -z $CDPLUG_CD_HOME ]];then
            export CHAIN_ORIGINAL_PARAMETERS=("~")
        else
            export CHAIN_ORIGINAL_PARAMETERS=$CDPLUG_CD_HOME
        fi
    fi
    CHAIN_NEXT
}


#
#cdplug_trigger(){
#CHAIN_NEXT
#if [[ $(ls -al | wc -l) == 3 ]];then
#    echo "looks like this folder is empty do you want to trigger a script\n(your scripts under the $HOME/.triggerscripts)"
#    if ! [[ -d $HOME/.triggerscripts ]];
#    then
#        mkdir $HOME/.triggerscripts
#    fi
#    let i=1
#    for s in $(ls $HOME/.triggerscripts);do
#        echo $i': '$s;
#    done
#
#fi
#}
