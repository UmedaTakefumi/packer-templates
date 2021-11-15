#!/usr/bin/env python

import click

def print_header():
  print("# Building Vagrant base boxes")

@click.group()
def cli():
  pass

@cli.command(help='Add the missing files.')
def add_files(add_files):
  click.echo(print_header())


@cli.command(help='Create a batch of vagrant boxes.')
def bulkbuild_vagrant_boxes():
  click.echo(print_header())


@cli.command(help='Check your current progress and create a todo list.')
def check_status_todolist():
  click.echo(print_header())


@cli.command(help='Delete all vagrant boxes related items at once.')
def bulk_delete_vagrant_boxes():
  click.echo(print_header()) 


@cli.command(help='Deletes temporarily created working files.')
def erase_files():
  click.echo(print_header())


@cli.command(help='Delete files that are not managed by the repository.')
def flush_files():
  click.echo(print_heaer())


@cli.command(help='Generates a skeleton file.')
def generate_skelton_files():
  click.echo(print_header())


if __name__ == '__main__':
  cli()

