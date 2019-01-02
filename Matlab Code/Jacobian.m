clear all
clear
syms d a alpha Theta D1 Th2 Th3 Th4 Th5 Th6 

T=[cosd(Theta), -sind(Theta)*cosd(alpha), sind(Theta)*sind(alpha), a*cosd(Theta);
    sind(Theta), cosd(Theta)*cosd(alpha), -cosd(Theta)*sind(alpha), a*sind(Theta);
    0,               sind(alpha),                 cosd(alpha),           d;
    0,               0,                             0,                    1]; %% General matrix

T1=subs(T,[Theta d  a alpha],[0 156.7+D1 0 90]);
T2=subs(T,[Theta d  a alpha],[Th2+90 300 0 -90]);
T3=subs(T,[Theta d  a alpha],[Th3 0 450 0]);
T4=subs(T,[Theta d  a alpha],[Th4 0 0 90]);
T5=subs(T,[Theta d  a alpha],[Th5 309 0 -90]);
T6=subs(T,[Theta d  a alpha],[Th6 100 360 0]); %% substitite according to DH table.

T=simplify(T1*T2*T3*T4*T5*T6) %% Final T matrix

%% Example Computing velocity Jacobian

Jv=simplify([diff(T(1,4),D1) diff(T(1,4),Th2) diff(T(1,4),Th3) diff(T(1,4),Th4) diff(T(1,4),Th5) diff(T(1,4),Th6);
    diff(T(2,4),D1) diff(T(2,4),Th2) diff(T(2,4),Th3) diff(T(2,4),Th4) diff(T(2,4),Th5) diff(T(2,4),Th6);
    diff(T(3,4),D1) diff(T(3,4),Th2) diff(T(3,4),Th3) diff(T(3,4),Th4) diff(T(3,4),Th5) diff(T(3,4),Th6)]);

Jw=[0  0   1   1   0   1;
0   1    0    0   1   0 ;
0   0   0   0   0   0]
%% Change Values
values=[0 0 0 0 0 0]
F =[100; 300; 200; 0; 0; 0]
%% Computing Jacobian

Jvs=subs(Jv,[D1 Th2 Th3 Th4 Th5 Th6],values)

J=[Jvs;Jw]



Torque = simplify(J'*F)

