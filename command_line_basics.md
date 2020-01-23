# Some command line basics

### getting help
Most commands in the commandline have either a _man_ page or a _--help_ function.

### executing scripts

Scripts can be executed by calling the correct interpreter with a script as argument.

```bash
bash my_bash_script.sh
perl ./my_perl_script.pl
python ~/my/dir/my_python_script.py
```

Most linux distributions have a **~/.bashrc** file that is executed when a terminal opens. To make all files in a specified directory executable from anywhere add the follwoing line to *~/.bashrc*:
```bash
export PATH=$PATH:/my/scripts/dir/
```
To make a file executable by just typing its name, change its mode like this:
```bash
chmod 777  my_script.sh
```
allows you to execute a program by doing this:
```bash
my_script.sh
```
