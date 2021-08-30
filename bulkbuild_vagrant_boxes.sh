#!/bin/bash

## Displays the usage of the script.
function print_how_to_use () {

  echo "  -a --add-files"
  echo "  -b --bulkbuild"
  echo "  -c --checkstatus"
  echo "  -j --jenkins"
  echo "  -h --help"

  exit 1

}

## Split the process and register it in a jenkins-job.
#function add_jenkins_job () {}

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

  if [ -z "$PACKER_TEMPLATE_BASEDIR" ]; then
    echo "Set the PACKER_TEMPLATE_BASEDIR."
    echo ""
    echo "example:"
    echo "  export PACKER_TEMPLATE_BASEDIR=$HOME/Temp/packer-templates"
    echo ""
    
    exit 1
  fi

  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)
  
  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    echo "## $VAGRAND_BOX_NAME"
    cd $PACKER_TEMPLATE_BASEDIR
    cd $VAGRAND_BOX_NAME

    if [ -f problem.md ]; then
      echo "skip ....."
      continue
    else
      packer build --only=virtualbox-iso template.json
      vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
    fi

    if [ -f $VAGRAND_BOX_NAME-virtualbox.box ]; then
      mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
      cd ~/Vagrant/$VAGRAND_BOX_NAME
      vagrant init $VAGRAND_BOX_NAME
    fi

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
      echo "* ✖ [NotOK] import box"
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

## copy and paste
## 
## ref: https://qiita.com/b4b4r07/items/dcd6be0bb9c9185475bb
for OPT in "$@"
do
  case $OPT in
    -h | --help)
        print_how_to_use
        exit 1
        ;;
    -a | --add-files)
        print_header
        add_files
        shift 1
        ;;
    -b | --bulkbuild)
        print_header
        bulkbuild_vagrant_boxes
        shift 1
        ;;
    -c | --checkstatus)
        print_header
        check_status_todolist
        shift 1
        ;;
    -- | -)
        shift 1
        param+=( "$@" )
        break
        ;;
    -*)
        echo "$PROGNAME: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
        exit 1
        ;;
    *)
        if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
            #param=( ${param[@]} "$1" )
            param+=( "$1" )
            shift 1
        fi
        ;;
  esac
done

