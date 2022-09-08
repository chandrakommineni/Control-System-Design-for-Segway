clc
clear all,
q = [ 1 0];
p = [9 -1.4e+04 -1];
a = 2;
b = [38.5 10.35];
d1 = conv(q, b)
d2 = conv(p,a)
d1+d2