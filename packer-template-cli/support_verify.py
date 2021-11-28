#!/usr/bin/env python

import click
import jinja2
import subprocess, shlex
import os
import logging
LOG_LEVEL = 'info'
if LOG_LEVEL == 'debug':
  FORMATTER = '%(asctime)s %(levelname)s %(module)s %(funcName)s %(message)s'
  logging.basicConfig(level=logging.DEBUG, format=FORMATTER)
elif LOG_LEVEL == 'info':
  logging.basicConfig(level=logging.INFO)

## Todo and Task
##    1. git ls-files | sort | awk -F/ '{print $1}' | uniq | grep -v .git | grep -v .md | grep -v .sh"])
##    2. conf = { 'x': 'ABC', 'y': 100, 'z': [200, 300, 400] } -> import json
##    3. filepath:
##         linux and macos -> /
##         windows -> \

## 
def build_flavor_dir():

  logging.debug('%s' % os.getcwd())
  os.chdir('../')
  logging.debug('%s' % os.getcwd())

  flavor_dir = []

  ## ToDoTask: no-shell
  cmd = 'git ls-files'
  output_stdout = []
  sub = subprocess.Popen(shlex.split(cmd), stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
  cmd_stdout = sub.stdout.read().splitlines()

  ## ToDoTask: -> json
  str_filepath_separator = '/'
  str_exempt = 'packer-template-cli'

  for str_temp in cmd_stdout:

    if str_filepath_separator in str_temp and str_exempt not in str_temp:

      logging.debug('%s' % str_temp)      
      idx = str_temp.find(str_filepath_separator)      
      logging.debug(str_temp[:idx])
      flavor_dir.append(str_temp[:idx])
  
  return set(flavor_dir)

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

  print(build_flavor_dir())
  
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

