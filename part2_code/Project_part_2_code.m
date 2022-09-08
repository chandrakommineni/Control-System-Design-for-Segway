clear all;
clc;
syms s k
C = k;
N3 = -(1.08*s + 0.0094);
N4 = 12.422;
D2 = (38.5*s + 10.35)
D1 = s^2-0.0014*s - 12.077;
CE = collect(expand(D1*D2 + C*N3), s);
k = solve(CE==0, k);
[poles, zeros]=numden(-k);
poles = double(flip(coeffs(poles, s)));
zeros = double(flip(coeffs(zeros, s)));
G = tf(zeros, poles);
rlocus(G);

A = [ 0 1 0; 12.077 -0.0014 0.1407; 0 0 -0.2606];
eig(A);

B = [0; -0.0281; 0.0519];

C = [1 0 0; 0 1 0; 0 0 1];
D = [ 0; 0; 0];
T = [0; 12.4221; 0];

pc = ctrb(A,B);
rank(pc)

O = obsv(A,C);
rank(O)

sys = ss(A,B,C, D);
modal_canon_form = canon(sys,'modal')
control_canon_form = transpose(canon(sys,'companion'))

p = [-15 -3+3i -3-3i];

k = acker(A,B,p);

obsv_p = [-150; -30+3i; -30-30i]
M = [1 1 0];
Y = acker(A', M', obsv_p);
Y = Y'


