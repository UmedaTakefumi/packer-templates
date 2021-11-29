#!/usr/bin/env python

import click
import jinja2
import subprocess, shlex
import os
import logging
## ToDo and Task: __init__.py
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
  cmd_git_lsfiles = 'git ls-files'
  output_stdout = []
  sub = subprocess.Popen(shlex.split(cmd_git_lsfiles), stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
  result_git_ls = sub.stdout.read().splitlines()

  filepath_separator = '/'
  dirname_exempt = 'packer-template-cli'

  for git_ls_temp in result_git_ls:

    ## stringに '/'(filepath_separator) が含まれているかを確認し、トップディレクトリのみの配列を作成する. 
    ## ただし特定のディレクトリ名(dirname_exempt)は、除外する.
    ## 
    ## DeepL: https://www.deepl.com/translator I'm not good at English.
    ##   Check if the string contains /, and create an array of top directories only.
    ##   However, certain directory names (dirname_exempt) are excluded.
    if filepath_separator in git_ls_temp and dirname_exempt not in git_ls_temp:

      logging.debug('%s' % git_ls_temp)

      ## ref(11/29/2021): https://atmarkit.itmedia.co.jp/ait/articles/2103/23/news022.html
      idx = git_ls_temp.find(filepath_separator)
      logging.debug(git_ls_temp[:idx])

      flavor_dir.append(git_ls_temp[:idx])
  
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

