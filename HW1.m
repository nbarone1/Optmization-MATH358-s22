%%% Nicholas Barone
%%% Goebel
%%% Math 358
%%% Homework 1 (This problem is identical to one from 315)

% Variables, C1,C2,C3 represent amount of each Cargo
% each is broken into F# and B# to represent the amount in each space
% F constraints 16 ton. 8700 m^3
% B 8 ton. 5300 m^3
% C1 = 18 ton. 480 m^3/ton. $310/ton.
% C2 = 15 ton. 650 m^3/ton. $380/ton.
% C3 = 23 ton. 580 m^3/ton. $350/ton.
% F1+F2+F3 = 2*(B1+B2+B3)
% Maximize $310*C1+$380*C2+$350*C3

prof = [-310 -380 -350 -310 -380 -350];
Fval = [18 15 23;
        480*18 650*15 580*23];

vals = [Fval zeros(2,3);
    zeros(2,3) Fval;
    eye(3) eye(3);
    1,0,0,1,0,0;
    0,1,0,0,1,0;
    0,0,1,0,0,1];

aim = [16;8700;8;5300;1;1;1;18;15;23];
balance = [18/16 15/16 23/16 -18/8 -15/8 -23/8];

s = linprog(prof,vals,aim,balance,0,[0;0;0;0;0;0],);

maxprof = prof*s*-1;
