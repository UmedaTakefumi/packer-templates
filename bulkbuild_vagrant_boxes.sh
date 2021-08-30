#!/bin/bash

## Displays the usage of the script.
function print_how_to_use () {

  echo "  -a --add-files"
  echo "  -b --bulkbuild"
  echo "  -c --checkstatus"
  echo "  -h --help"

  exit 1

}

## Add the missing files.
function add_files () {

  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)

  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    echo "## $VAGRAND_BOX_NAME"

    if [ ! -f $VAGRAND_BOX_NAME/note.md ]; then
      touch $VAGRAND_BOX_NAME/note.md
    fi

  done

}

## Create a batch of vagrant boxes.
function bulkbuild_vagrant_boxes () {

  if [ -z "$PACKER_TEMPLATE"]; then
    echo "Set the PACKER_TEMPLATE."
    echo ""
    echo "example:"
    echo "  export PACKER_TEMPLTE=$HOME/Temp/packer-templates"
    echo ""
    
    exit 1
  fi

  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)
  
  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    echo "## $VAGRAND_BOX_NAME"
    cd $VAGRAND_BOX_NAME
    packer build --only=virtualbox-iso template.json
    vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
    mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
    cd ~/Vagrant/$VAGRAND_BOX_NAME
    vagrant init $VAGRAND_BOX_NAME

  done

}

## Check your current progress and create a todo list.
function check_status_todolist () {
  
  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)

  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    echo -e "## $VAGRAND_BOX_NAME\n"
    
    if [ -f $VAGRAND_BOX_NAME/$VAGRAND_BOX_NAME-virtualbox.box ]; then
      echo "* ✅ [OK] build box"
    else
      echo "* ✖ [NotOK] build box"
    fi
    
    vagrant box list | grep $VAGRAND_BOX_NAME | grep virtualbox > /dev/null
    if [ $? = 0 ]; then
      echo "* ✅ [OK] import box"
    else
      echo "* ✖ [NotOK] import box [NotOK]"
    fi

    if [ -d ~/Vagrant/$VAGRAND_BOX_NAME ]; then
      echo "* ✅ [OK] mkdir directory"
    else
      echo "* ✖ [NotOK] mkdir direcotry"
    fi

    if [ -f ~/Vagrant/$VAGRAND_BOX_NAME/Vagrantfile ]; then
      echo "* ✅ [OK] vagrant init"
    else
      echo "* ✖ [NotOK] vagrant init"
    fi

    echo -e "\n"

  done

}

## Displays the header string when the script is executed.
function print_header () {

  echo -e "# Building Vagrant base boxes\n"

}


print_header
bulkbuild_vagrant_boxes

print_header

