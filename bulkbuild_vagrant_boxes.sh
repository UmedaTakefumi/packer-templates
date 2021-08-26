#!/bin/bash

function bulkbuild_vagrant_boxes () {

  TEMPLATE_DIRS=$(git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh)
  
  for temp in ${TEMPLATE_DIRS[@]}; do
    echo "## $temp" 
  done
}

echo "# Building Vagrant base boxes"

bulkbuild_vagrant_boxes
