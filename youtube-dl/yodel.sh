#!/bin/bash
echo "Starting yodel"

    # handmade getopt
    for i in "$@"
    do
    case $i in
        -v=*|--video=*|-pl=*)
            VIDEO="${i#*=}"
            shift
        ;;
        -o=*|-d=*|--out=*|--dir=*)
            OUTPUT_DIR="${i#*=}"
            shift
        ;;
        *)
        # unknown option
        ;;
    esac
    done

    # check url on exists
    if [ -z $VIDEO ]
    then
        echo "ERROR: options -v=.. (url to video) is empty"
        exit
    fi

    # check dir
    if [ -z $OUTPUT_DIR ]
    then
        OUTPUT_DIR="."
    fi

    # simple relpath to abs
    case $OUTPUT_DIR in
        ".")
            OUTPUT_DIR=$PWD
        ;;
        "..")
            OUTPUT_DIR=$(dirname "$(pwd)")
        ;;
        "~/"*)
            OUTPUT_DIR=$HOME/${OUTPUT_DIR#"~/"}
        ;;
        [^/]*)
            OUTPUT_DIR=$PWD/$OUTPUT_DIR
        ;;
    esac

    # check dir on exists
    if [ ! -d "$OUTPUT_DIR" ]; then
        echo "Directory $OUTPUT_DIR not exists."
        read -p "Do you want to create it? [y/n]" yn
        case $yn in
            [Yy]* )
                mkdir -p $OUTPUT_DIR
                echo "path $OUTPUT_DIR created"
            ;;
            [Nn]* )
                exit
            ;;
            * )
                echo "Cant undestand your answer."
                exit
            ;;
        esac
    else
        echo "choosed directory: $OUTPUT_DIR"
    fi

docker run --rm -v $OUTPUT_DIR:/tmp/download -it turneps403/youtube-dl $VIDEO
echo "Stopping yodel"
