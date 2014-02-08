#!/bin/bash

while true; do
    for nbfile in *.ipynb; do
        slidefile=${nbfile/%.ipynb/.slides.html}
        if [[ ! -e $slidefile ]] || [[ `stat -c%Y "$nbfile"` -gt `stat -c%Y "$slidefile"` ]]; then
            echo "\nConverting $nbfile to $slidefile"
            ./make_slide.py "$nbfile"
        fi
    done
    echo -n "."
    sleep 1
done
