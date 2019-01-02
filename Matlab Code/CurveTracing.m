 clear all
 clc
% %% inverse parameters
% alpha=linspace(-90,-90,50)
% beta=linspace(90,90,50)
% gamma=linspace(90,90,50)
% X=linspace(-200,-250,50) 
% Y=linspace(-127.5,-127.5,50)
% Z=linspace(729.3,729.3,50)
% 
% Rz=[cosd(gamma) -sind(gamma) 0;
%    sind(gamma) cosd(gamma)  0;
%    0            0          1;]
% 
% Ry=[cosd(beta) 0 -sind(beta);
%     0           1          0;  
%     sind(beta) 0 cosd(beta)];
% 
% Rx=[1            0          0;
%     0 cosd(alpha) -sind(alpha) ;
%     0 sind(alpha) cosd(alpha) ];
% 
% T=[0 0 -1 linspace(-200,-250,50);
%    0 1 0 -127.5;
%    1 0 0 729.3;
%    0 0 0 1]

% 
% R=Rz*Ry*Rx
% D=[X;Y;Z]
% zero=[0 0 0];
% T=[R D;
%    zero 1;]

I = 100
for i =1:1:I
T11=1
T12=0
T13=0
T14=-200
T21=0
T22=1
T23=0
T24=-127.5-0.5i
T31=0
T32=0
T33=1
T34=729.3
A1=0;
A3=0;
A4=0;
A5=0;
A6=0;

Th5 =acos(-T13);

Th6 = acos(-T11/sin(Th5));

Th3=(asin((T24-(309*(T33/sin(Th5)) + 100*T23 - 180*(T23/sin(Th5))*cos(Th5 - Th6) - 180*cos(Th5 + Th6)*(T23/sin(Th5)) - 360*(T33/sin(Th5))*sin(Th6) - 300))/450))

Th4= (asin(-(T23/sin(Th5)))-Th3 );

D1 = (T34 -(309*sin(Th3 + Th4) + 450*cos(Th3) - 360*sin(Th3 + Th4)*sin(Th6) + 180*cos(Th3 + Th4)*cos(Th5 + Th6) - 100*cos(Th3 + Th4)*sin(Th5) + 180*cos(Th3 + Th4)*cos((Th5 - Th6)) + 156.7))
A(:,i) = [D1 Th3 Th4 Th5 Th6];
end

%%
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
B=zeros(1,I)
 values=[A(1,:)' B' A(2,:)' A(3,:)' A(4,:)' A(5,:)' ];

%% Example output for validation
for i=1:1:I
Output1=subs(T_1,[D1 Th2 Th3 Th4 Th5 Th6 ],values(i,:));
Output2=subs(T_2,[D1 Th2 Th3 Th4 Th5 Th6 ],values(i,:));
Output3=subs(T_3,[D1 Th2 Th3 Th4 Th5 Th6 ],values(i,:));
Output4=subs(T_4,[D1 Th2 Th3 Th4 Th5 Th6 ],values(i,:));
Output5=subs(T_5,[D1 Th2 Th3 Th4 Th5 Th6 ],values(i,:));
Output6=subs(T_6,[D1 Th2 Th3 Th4 Th5 Th6 ],values(i,:));

Outputx(i,:)=[0 Output1(1,4) Output2(1,4) Output3(1,4) Output4(1,4) Output5(1,4) Output6(1,4)];
Outputy(i,:)=[0 Output1(2,4) Output2(2,4) Output3(2,4) Output4(2,4) Output5(2,4) Output6(2,4)];
Outputz(i,:)=[values(1,1) Output1(3,4) Output2(3,4) Output3(3,4) Output4(3,4) Output5(3,4) Output6(3,4)]
end
%% 3D plot
hold on
for i = 1:1:I
plot3(Outputx(i,:),Outputy(i,:),Outputz(i,:),'-*b')
pause(0.05)
end
grid on
axis square