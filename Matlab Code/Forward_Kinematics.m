clear all
clear
syms d a alpha Theta D1 Th2 Th3 Th4 Th5 Th6 

T=[cos(Theta), -sin(Theta)*cos(alpha), sin(Theta)*sin(alpha), a*cos(Theta);
    sin(Theta), cos(Theta)*cos(alpha), -cos(Theta)*sin(alpha), a*sin(Theta);
    0,               sin(alpha),                 cos(alpha),           d;
    0,               0,                             0,                    1]; %% General matrix

T1=subs(T,[Theta d  a alpha],[0 156.7+D1 0 90*pi()/180]);
T2=subs(T,[Theta d  a alpha],[Th2*pi()/180+90*pi()/180 300 0 -90*pi()/180]);
T3=subs(T,[Theta d  a alpha],[Th3*pi()/180 0 450 0]);
T4=subs(T,[Theta d  a alpha],[Th4*pi()/180 0 0 90*pi()/180]);
T5=subs(T,[Theta d  a alpha],[Th5*pi()/180 309 0 -90*pi()/180]);
T6=subs(T,[Theta d  a alpha],[Th6*pi()/180 100 360 0]); %% substitite according to DH table.

T_1=simplify(T1);
T_2=simplify(T1*T2);
T_3=simplify(T1*T2*T3);
T_4=simplify(T1*T2*T3*T4);
T_5=simplify(T1*T2*T3*T4*T5);
T_6=simplify(T1*T2*T3*T4*T5*T6) %% Final T matrix

 %% Example output for validation change the value to change the end effector
values=[225 0 45 45 45 45];

%% Example output for validation
Output1=subs(T_1,[D1 Th2 Th3 Th4 Th5 Th6 ],values);
Output2=subs(T_2,[D1 Th2 Th3 Th4 Th5 Th6 ],values);
Output3=subs(T_3,[D1 Th2 Th3 Th4 Th5 Th6 ],values);
Output4=subs(T_4,[D1 Th2 Th3 Th4 Th5 Th6 ],values);
Output5=subs(T_5,[D1 Th2 Th3 Th4 Th5 Th6 ],values);
Output6=subs(T_6,[D1 Th2 Th3 Th4 Th5 Th6 ],values)

Outputx=[0 Output1(1,4) Output2(1,4) Output3(1,4) Output4(1,4) Output5(1,4) Output6(1,4)]
Outputy=[0 Output1(2,4) Output2(2,4) Output3(2,4) Output4(2,4) Output5(2,4) Output6(2,4)]
Outputz=[values(1,1) Output1(3,4) Output2(3,4) Output3(3,4) Output4(3,4) Output5(3,4) Output6(3,4)]
%% 3D plot


plot3(Outputx,Outputy,Outputz,'-*b')
grid on
axis square

linspace(1,50,50)