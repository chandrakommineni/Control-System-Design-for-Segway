clc;
clear all;
close all;

c1 = 0.1;
c2 = 0.1;
g = 9.81;
R = 0.35;
L = 0.55;
l = 0.85;
M = 20;
m = 90;
KT = 2;
Kb = 1.75;
ra = 1;


syms s t x a b J d v G3 G4 kp kd ki p
% t is theta, a - aplha, b - beta
J = m*l^2 + M*L^2;
a = KT/ra;
b = KT* Kb/R/ra;
%eq1 = s*s*t == (M*g*L+m*g*l)/J*t + b/J*s*x - a/J*v + m*g/J*d + c1/J*s*t;
eq2 = s*s*x == a/R/(M+m)*v - ((b/R)+c2)/(M+m)*s*x;
x = simplify(solve(eq2, x));
eq1 = s*s*t == (M*g*L+m*g*l)/J*t + b/J*s*x - a/J*v + m*g/J*d + c1/J*s*t;
t = simplify((solve(eq1, t)));
t = collect(t, v)


[num4, den4] = numden(-(35316)/(2843*(- s^2 + (4*s)/2843 + 34335/2843)))
num4 = double(flip(coeffs(num4, s)));
den4 = double(flip(coeffs(den4, s)));
G4 = tf(num4, den4);
p4 = pole(G4)

[num3, den3] = numden(-(160000/(2843*(7700*s + 2007)) - 80/2843)/(- s^2 + (4*s)/2843 + 34335/2843));
num3 = double(flip(coeffs(num3, s)));
den3 = double(flip(coeffs(den3, s)));
G3 = tf(num3, den3);
p3 = pole(G3)





