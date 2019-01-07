#!/bin/bash

# check bundle install
bundleCheck(){
    if [ ! -d "~/.vim/bundle/$1" ]; then
        eval $2
    else 
        echo "Have installed $1 yet"
    fi
}


