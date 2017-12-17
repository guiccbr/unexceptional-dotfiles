#!/bin/sh

SOURCE_PATH="$1"
DEST_PATH="$2"

echo "Creating Symlinks"
echo "  From: `readlink -f ${DEST_PATH}`"
echo "  To: `readlink -f ${SOURCE_PATH}`"
echo

for i in `ls ${SOURCE_PATH}`;
do
    echo "Creating symlink .${i} in ${DEST_PATH}"
    read -p "Are you sure? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        ln --backup=existing -s $(readlink -f ${SOURCE_PATH}/${i}) \
            $(readlink -f ${DEST_PATH}/.${i})
    fi
done
