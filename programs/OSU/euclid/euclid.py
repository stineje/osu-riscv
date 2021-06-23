#!/usr/bin/python

x = 817
y = 21

print x,y

while x!=y:
    while x>y:
        x -= y
        print x,y
    while y>x:
        y -= x
        print x,y
