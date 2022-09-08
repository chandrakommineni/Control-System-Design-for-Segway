clear all;
clc;

for k = 1:2000
    kp(k) = -k;
    y(k) =  (- 0.0101*kp(k)^2 + 443.3308*kp(k) + 2.0565e+05)/(1.0793*kp(k) + 489.3136);
end

plot(kp,y)
    