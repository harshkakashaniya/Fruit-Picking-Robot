 clear all
 clc
% %% inverse parameters
% alpha=-80
% beta=60
% gamma=20
% X=-250.7
% Y= 127.5
% Z=729.3
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
% R=Rz*Ry*Rx
% D=[X;Y;Z]
% zero=[0 0 0];
% T=[R D;
%    zero 1;]
%% Example of configuration [200 0 45 45 45 45]^T parameters

T= [     -1/2,        1/2, -2^(1/2)/2,   - 50*2^(1/2) - 180;
        1/2,       -1/2, -2^(1/2)/2,    175*2^(1/2) - 120;
 -2^(1/2)/2, -2^(1/2)/2,          0, 45*2^(1/2) + 6657/10;
          0,          0,          0,                    1]


Th5 =acos(-T(1,3))

Th6 = acos(-T(1,1)/sin(Th5))

Th3=(asin((T(2,4)-(309*(T(3,3)/sin(Th5)) + 100*T(2,3) - 180*(T(2,3)/sin(Th5))*cos(Th5 - Th6) - 180*cos(Th5 + Th6)*(T(2,3)/sin(Th5)) - 360*(T(3,3)/sin(Th5))*sin(Th6) - 300))/450))

Th4 = (asin(-(T(2,3)/sin(Th5)))-Th3 )

D1= (T(4,3)-(309*sin(Th3 + Th4) + 450*cos(Th3) - 360*sin(Th3 + Th4)*sin(Th6) + 180*cos(Th3 + Th4)*cos(Th5 + Th6) - 100*cos(Th3 + Th4)*sin(Th5) + 180*cos(Th3 + Th4)*cos((Th5 - Th6)) + 156.7))



%% R matrix for 


% 
% [                                                                        -cos((pi*Th6)/180)*sin((pi*Th5)/180),                                                                           sin((pi*Th5)/180)*sin((pi*Th6)/180),                           -cos((pi*Th5)/180),                                                                                                                                                                                                                            - 100*cos((pi*Th5)/180) - 360*cos((pi*Th6)/180)*sin((pi*Th5)/180)]
% [ cos((pi*(Th3 + Th4))/180)*sin((pi*Th6)/180) + sin((pi*(Th3 + Th4))/180)*cos((pi*Th5)/180)*cos((pi*Th6)/180),   cos((pi*(Th3 + Th4))/180)*cos((pi*Th6)/180) - sin((pi*(Th3 + Th4))/180)*cos((pi*Th5)/180)*sin((pi*Th6)/180), -sin((pi*(Th3 + Th4))/180)*sin((pi*Th5)/180),          450*sin((pi*Th3)/180) - 309*cos((pi*(Th3 + Th4))/180) - 100*sin((pi*(Th3 + Th4))/180)*sin((pi*Th5)/180) + 180*sin((pi*(Th3 + Th4))/180)*cos((pi*(Th5 - Th6))/180) + 180*cos((pi*(Th5 + Th6))/180)*sin((pi*(Th3 + Th4))/180) + 360*cos((pi*(Th3 + Th4))/180)*sin((pi*Th6)/180) - 300]
% [ cos((pi*(Th3 + Th4))/180)*cos((pi*Th5)/180)*cos((pi*Th6)/180) - sin((pi*(Th3 + Th4))/180)*sin((pi*Th6)/180), - sin((pi*(Th3 + Th4))/180)*cos((pi*Th6)/180) - cos((pi*(Th3 + Th4))/180)*cos((pi*Th5)/180)*sin((pi*Th6)/180), -cos((pi*(Th3 + Th4))/180)*sin((pi*Th5)/180), D1 + 309*sin((pi*(Th3 + Th4))/180) + 450*cos((pi*Th3)/180) - 360*sin((pi*(Th3 + Th4))/180)*sin((pi*Th6)/180) + 180*cos((pi*(Th3 + Th4))/180)*cos((pi*(Th5 + Th6))/180) - 100*cos((pi*(Th3 + Th4))/180)*sin((pi*Th5)/180) + 180*cos((pi*(Th3 + Th4))/180)*cos((pi*(Th5 - Th6))/180) + 1567/10]
% [                                                                                                           0,                                                                                                             0,                                            0,                                                                                                                                                                                                                                                                                            1]
% 
