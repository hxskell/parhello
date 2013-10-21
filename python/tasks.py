from invoke import run, task

@task
def test():
  run("python parhello.py")

@task
def lint():
  run("pylint *.py")
