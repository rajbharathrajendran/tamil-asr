fp=open('cmd.sh')
str = fp.read()
list = str.split("\n")
list.sort()
print list
