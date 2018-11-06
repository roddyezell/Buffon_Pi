clc
clear all

rng('shuffle')
z = 0;
n = 0;
n_ok = 0;
m = 1000;

L = 2.5;
SqL = 8.4;
line1 = SqL/3;
line2 = 2*SqL/3;

while n < m
    
    x = rand * SqL;
    y = rand * SqL;
    ang = rand * pi;

     if x < line1 && x+L*cos(ang) > line1
        z = z + 1;
     elseif x > line1 && x+L*cos(ang) < line1
        z = z + 1;
     elseif x < line2 && x+L*cos(ang) > line2
        z = z + 1;
     elseif x > line2 && x+L*cos(ang) < line2
        z = z + 1;
     end
            
     if x+L*cos(ang) > 0 && x > 0 && x+L*cos(ang) < SqL
        if y+L*sin(ang) > 0 && y+L*sin(ang) < SqL
            n_ok = n_ok + 1;   
        end
     end 
           n = n + 1;          
end

aprxpi = (2 * L * n_ok)/(line1 * z);

true_err = pi - aprxpi;
rel_err = true_err/pi;


disp(aprxpi)
disp(true_err)
disp(rel_err)





