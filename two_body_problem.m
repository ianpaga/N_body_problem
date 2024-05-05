%TWO BODY PROGRAM
%Special case of the N-body program.


%h = 0.0001;   %years
%N = 30000;    %iterations
M = 3;      %number of particles
h = 0.01;   
N = 10000;

W = zeros(6, M);
m = [1, 3.15,3.4e-07];

wsun = [0, 0, 0, 0, 0, 0]';
wearth = [0, 0.99, 0, -6.2706, 0, 0];
wmars = [0, 1.52, 0, -5.0535, 0, 0];


%initialize W with M number of particles
W(:,1) = wsun;
W(:,2) = wearth;
W(:,3) = wmars;


%runge-kutta update rule

[x,y,vx,vy,t] = runge_kutta(W,M,N,h,m);

%trucation error estimation for 4th order Runge-Kutta

[x2,y2,vx2,vy2,t2] = runge_kutta(W,M,N,2*h,m);

Ex_simple = (x - x2)/(2^5 - 1);
Ey_simple = (y - y2)/(2^5 - 1);

%plots

%figure    
%plot(t(1:1000),x(1:1000,2))
%title('Earth x(t)')
%xlabel('Time in years')
%ylabel('x distance in AU')

%figure  
%plot(t(1:1000),x(1:1000,2))
%xlabel('Time in years')
%ylabel('Distance in AU')
%title('x(t) position as function of time of the earth')

figure 
plot(x(1:7000,1),y(1:7000,1),'.b',x(1:7000,2),y(1:7000,2),'.r',x(1:7000,3),y(1:7000,3),'.g')
xlabel('x[AU]')
ylabel('y[AU]')
title('x-y')
axis([-3 3 -3 3])


%plotting errors

 %figure
  
 %plot(t(1:500),Ex_simple(1:500,2),'k')
 %xlabel('x in AU')
 %ylabel('y in AU')
 % %title('x-y trajectory of each planet after 80 years')
 