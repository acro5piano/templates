#!/bin/bash

set -eu

ROOT_DIR=`cd $(dirname $0); pwd`
TEMPLATE_PATH=$ROOT_DIR/assets

template::dev() {
    test -e $ROOT_DIR/.dev
}

template::filter() {
    if which -s fzf; then
        echo fzf
        return
    fi

    if which -s peco; then
        echo peco
        return
    fi

    if which -s percol; then
        echo peco
        return
    fi
}

template::main() {
    if template::dev; then
        set -x
    fi

    if [ -z $1 ]; then
        echo 'Error: argument 1 needed' 1>&2
        return 1
    fi

    to=$1

    if [ -e $to ]; then
        read -p "overwrite $to? (y/n [n]) " overwrite
        if [ $overwrite == 'n' ]; then
            echo 'Abort'
            return 2
        fi
    fi

    from=`find $TEMPLATE_PATH -type f | perl -pe "s;$TEMPLATE_PATH;;" | $(template::filter)`
    cp $TEMPLATE_PATH/$from $to

    echo "Success:"
    echo "    $from -> $to"

    read -p "component name > " name
    perl -i -pe "s;\@template\('NAME'\);$name;g" $to
}

template::main $@
