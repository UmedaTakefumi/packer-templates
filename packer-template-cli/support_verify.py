#!/usr/bin/env python

import click
import jinja2
import subprocess, shlex
import os

from logging import getLogger, StreamHandler, DEBUG, INFO
LOG_LEVEL = 'DEBUG'
FORMAT = '%(asctime)s %(levelname)s %(message)s'
logger = getLogger(__name__)
handler = StreamHandler()
handler.setLevel(LOG_LEVEL)
logger.setLevel(LOG_LEVEL)
logger.addHandler(handler)
logger.propagate = False
#logger.basicConfig(format=FORMAT)

## Todo and Task
##    1. git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh"])
##    2. conf = { 'x': 'ABC', 'y': 100, 'z': [200, 300, 400] } -> import json
##    3. filepath:
##         linux and macos -> /
##         windows -> \

## 
def print_header():
  print("# Building Vagrant base boxes")

@click.group()
def cli():
  pass

## 
@cli.command(help='Add the missing files.')
def add_files(add_files):
  click.echo(print_header())

## 
@cli.command(help='Create a batch of vagrant boxes.')
def bulkbuild_vagrant_boxes():
  click.echo(print_header())

## 
@cli.command(help='Check your current progress and create a todo list.')
def check_status_todolist():
  click.echo(print_header())
  
  logger.debug('%s' % os.getcwd())
  os.chdir('../')
  logger.debug(' %s' % os.getcwd())

  flavor_dir = []

  ## atode: no-shell
  cmd = 'git ls-files'
  output_stdout = []
  sub = subprocess.Popen(shlex.split(cmd), stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
  cmd_stdout = sub.stdout.read().splitlines()

  ## atode... -> json
  str_slash = '/'
  str_exempt = 'packer-template-cli'

  for str_temp in cmd_stdout:
    if str_slash in str_temp and str_exempt not in str_temp:
      logger.debug('%s' % str_temp)
      idx = str_temp.find(str_slash)
      logger.debug(str_temp[:idx])
      flavor_dir.append(str_temp[:idx])
  
  print(set(flavor_dir))

## 
@cli.command(help='Delete all vagrant boxes related items at once.')
def bulk_delete_vagrant_boxes():
  click.echo(print_header()) 

## 
@cli.command(help='Deletes temporarily created working files.')
def erase_files():
  click.echo(print_header())

## 
@cli.command(help='Delete files that are not managed by the repository.')
def flush_files():
  click.echo(print_heaer())

## 
@cli.command(help='Generates a skeleton file.')
def generate_skelton_files():
  click.echo(print_header())


if __name__ == '__main__':
  cli()

