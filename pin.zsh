#!/bin/zsh
alias pinl="pin last"
PIN_LIST="${JAP_FOLDER}plugins/packages/pin/config/pins.json"
PIN_temp="${JAP_FOLDER}plugins/packages/pin/config/temp.json"
pin() {
    if [[ "$1" == "v" || "$1" == "-v" ]]; then
    echo -e "${BBLUE}*- PIN -*${NC}"
    echo -e "${BOLD}v0.1.0${NC}"
    echo -e "${YELLOW}JAP plugin${NC}"
    return 0
    elif [[ "$1" == "c" ]];then
        name="$2"
        pwd=$(pwd)
        jq --arg key "$name" --arg value "$pwd" '. + {($key): $value}' $PIN_LIST > $PIN_temp && mv $PIN_temp $PIN_LIST
    elif [[ "$1" == "d" ]];then
        name="$2"
        jq "del(.$name)" $PIN_LIST > $PIN_temp && mv $PIN_temp $PIN_LIST
    
    elif [[ "$1" == "list" || "$1" == "l" ]];then
        jq . $PIN_LIST
    elif [[ "$1" == "last" ]];then
         tp=$(jq -r '.[keys_unsorted[-1]]' $PIN_LIST)
         cd $tp
    elif [[ "$1" == "--clear" ]];then
        echo {} > $PIN_LIST
    else
       if [[ "$1" == "" ]];then
         name="pin"$RANDOM
         pwd=$(pwd)
         jq --arg key "$name" --arg value "$pwd" '. + {($key): $value}' $PIN_LIST > $PIN_temp && mv $PIN_temp $PIN_LIST
       else
            tp=$(jq -r ".$1" $PIN_LIST)
            cd $tp
       fi
    fi
}