clear all;
clc;
syms s eps kp ki kd
%kd = -500;
%ki = -500;
%kp = -1000;
C = (kd*s^2+ kp*s + ki);
N3 = -(1.08*s + 0.0094);
N4 = 12.422
D2 = (38.5*s + 10.35)
D1 = s^2-0.0014*s - 12.077;
CE = collect(expand(D1*D2*s + C*N3), s)
coeffs(CE, s)
Routh_array = flip(coeffs(CE, s))
RA=routh1(Routh_array,eps)
