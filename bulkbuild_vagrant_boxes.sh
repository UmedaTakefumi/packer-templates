#!/bin/bash

## 
function bulkbuild_vagrant_boxes () {

  TEMPLATE_DIRS=$1
  
  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    echo "## $VAGRAND_BOX_NAME"
    cd $VAGRAND_BOX_NAME
    packer build --only=virtualbox-iso template.json
    vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
    mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
    cd ~/Vgrant/$VAGRAND_BOX_NAME
    vagrant init $VAGRAND_BOX_NAME

  done
}

## 
function CheckStatus_todolist () {
  
  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)

  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    echo -e "## $VAGRAND_BOX_NAME\n"
    if [ -f $VAGRAND_BOX_NAME/$VAGRAND_BOX_NAME-virtualbox.box ]; then
      echo "* build box [OK]"
    else
      echo "* build box [NotOK]"
    fi
  
    echo -e "\n"
    
  done
}

echo -e "# Building Vagrant base boxes\n"

#bulkbuild_vagrant_boxes

CheckStatus_todolist

