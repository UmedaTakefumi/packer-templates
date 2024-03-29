#!/bin/bash

# A script to support testing.
# Only the maintainer of this repository is useful.

## Displays the usage of the script.
function print_how_to_use () {

  echo "  -a  --add-files"
  echo "  -b  --bulkbuild"
  echo "  -c  --checkstatus"
  echo "  -d  --deleteboxex"
  echo "  -e  --erasefiles"
  echo "  -f  --flushfiles"
  echo "  -g  --generate_skelton_files"
  echo "  -h  --help"

}

### Split the process and register it in a jenkins-job.
#function add_jenkins_job () {
#
#  echo "examination ....."
#
#}

### Use the strace command to check the status of the virtualbox and determine its behavior.
#function check_the_status_of_virtualbox () {
#
#  echo "examination ....."
#
#}

## Displays the header string when the script is executed.
function print_header () {

  echo -e "# Building Vagrant base boxes\n"

}

## Generates a skeleton file. 
function generate_skelton_files () {

  read -p "Please enter a packer template directory name.: " PACKER_TEMPLATE_DIR
  echo "packer template dir: $PACKER_TEMPLATE_DIR"

  if [ -d $PACKER_TEMPLATE_DIR ]; then
    echo "A directory with the same name already exists."
  else
    mkdir -p $PACKER_TEMPLATE_DIR
    touch $PACKER_TEMPLATE_DIR/{readme.md,template.json,note.md}
    echo -e "\n"
    ls -l $PACKER_TEMPLATE_DIR
 
    if [ -f $PACKER_TEMPLATE_DIR/readme.md ] && \
       [ -f $PACKER_TEMPLATE_DIR/template.json ] && \
       [ -f $PACKER_TEMPLATE_DIR/note.md ]; then
      echo -e "\ncomplate ......!"
    else
      echo "exception ...... orz..."
    fi
  fi

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

  if [ -z "$PACKER_TEMPLATE_BASEDIR" ]; then
    echo "Set the PACKER_TEMPLATE_BASEDIR."
    echo ""
    echo "example:"
    echo "  export PACKER_TEMPLATE_BASEDIR=$(pwd)"
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
  
  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh | grep -v support_verify)

  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    echo -e "## $VAGRAND_BOX_NAME\n"
    
    if [ -f $VAGRAND_BOX_NAME/$VAGRAND_BOX_NAME-virtualbox.box ]; then
      echo "* ✅ [OK] build box"
    else
      echo "* 💩 [NotOK] build box"
    fi
    
    vagrant box list | grep $VAGRAND_BOX_NAME | grep virtualbox > /dev/null
    if [ $? = 0 ]; then
      echo "* ✅ [OK] import box"
    else
      echo "* 💩 [NotOK] import box"
    fi

    if [ -d ~/Vagrant/$VAGRAND_BOX_NAME ]; then
      echo "* ✅ [OK] mkdir directory"
    else
      echo "* 💩 [NotOK] mkdir direcotry"
    fi

    if [ -f ~/Vagrant/$VAGRAND_BOX_NAME/Vagrantfile ]; then
      echo "* ✅ [OK] vagrant init"
    else
      echo "* 💩 [NotOK] vagrant init"
    fi

    
    if [ -f $VAGRAND_BOX_NAME/problem.md ]; then
      echo -e "\n### problem"
      cat $VAGRAND_BOX_NAME/problem.md
    fi
    echo -e "\n"

  done

}

## Delete all vagrant boxes related items at once.
function bulk_delete_vagrant_boxes () {

  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)

  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do
  
    #vagrant box remove --force $VAGRAND_BOX_NAME
    vagrant box list | grep $VAGRAND_BOX_NAME | grep virtualbox > /dev/null
    if [ $? = 0 ]; then
      echo "Delete $VAGRAND_BOX_NAME:"
      vagrant box remove --force $VAGRAND_BOX_NAME
    fi

  done

}

## Deletes temporarily created working files.
function erase_files () {

  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)

  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    if [ -d ./$VAGRAND_BOX_NAME/packer_cache/port     ] || \
       [ -d ./$VAGRAND_BOX_NAME/output-virtualbox-iso ]; then
        echo "cleaning $VAGRAND_BOX_NAME ......"
        rm -rfv ./$VAGRAND_BOX_NAME/packer_cache/port
        rm -rfv ./$VAGRAND_BOX_NAME/output-virtualbox-iso      
    fi

  done

}

## Delete files that are not managed by the repository.
function flush_files () {

  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)

  for VAGRAND_BOX_NAME in ${TEMPLATE_DIRS[@]}; do

    if [ -d ./$VAGRAND_BOX_NAME/packer_cache     ]      || \
       [ -d ./$VAGRAND_BOX_NAME/output-virtualbox-iso ] || \
       [ -f ./$VAGRAND_BOX_NAME/$VAGRAND_BOX_NAME-virtualbox.box ]; then
        echo "cleaning $VAGRAND_BOX_NAME ......"
        rm -rfv ./$VAGRAND_BOX_NAME/packer_cache
        rm -rfv ./$VAGRAND_BOX_NAME/output-virtualbox-iso
        rm -rfv ./$VAGRAND_BOX_NAME/$VAGRAND_BOX_NAME-virtualbox.box
    fi

  done

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
    -d | --deleteboxex)
        print_header
        bulk_delete_vagrant_boxes
        shift 1
        ;;
    -e | --erasefiles)
        print_header
        erase_files
        shift 1
        ;;
    -f | --flushfiles)
        print_header
        flush_files
        shift 1
        ;;
    -g | --generate-skelton-files)
        print_header
        generate_skelton_files
        shift 1
        ;;
#    -j | --jenkins)
#        print_header
#        add_jenkins_job
#        shift 1
#        ;;
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

if [ -z "$param" ]; then
    echo "$PROGNAME: too few arguments" 1>&2
    echo "Try '$PROGNAME --help' for more information." 1>&2
    exit 1
fi
