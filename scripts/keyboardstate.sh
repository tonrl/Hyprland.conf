#!/usr/bin/env bash

function get_input {
        [[ $(fcitx5-remote) -eq 2 ]] &&echo "  JP" || echo "  EN" 
}

function change_input {
        if [[ $(fcitx5-remote) -eq 2 ]]; then
                fcitx5-remote -c&
        else
                fcitx5-remote -o&
fi


}

case $1 in
        get)
                get_input
                ;;
        change)
                change_input
                ;;
        *)
                echo "Usage: $0 {options}"
                echo ""
                echo "get_input, change_input"
                exit 1
                ;;

        esac
 


