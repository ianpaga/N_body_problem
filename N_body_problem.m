%DESCRIPTION OF MAIN PROGRAM 
%AUTHOR: IAN PADILLA
%Main program to simulation positions and velocities of eight planets and
%two Trojans orbiting the Sun. The main feautures of this program are the
%Runge-Kutta algorithm and the function called g_functions. The latter
%computes the total force acting on all particles and then passes it on to
%the Runge-Kutta update rule to predict the next iteration element.

%NOTE: what I call N in the program is not the same N in "N-body-problem".
%The parameter M represents the number of particles in simulation ("M-body-problem")

%PARAMETERS

h = 0.01;     % time step in years
N = 30000;    %iterations
M = 11;       %number of particles

W = zeros(6, M);        %initializing matrix containing positions and velocities
                        
                        %Masses matrix
m = [1, 1.7e-07, 2.5e-06, 3.15e-06, 3.4e-07, 0.001, 3e-4, 4.6e-5, 5.4e-5, 0, 0];
                        
%input vectors for W-matrix
wsun = [0, 0, 0, 0, 0, 0]';
wmer = [0, 0.38, 0, -9.9723, 0, 0];
wven = [0, 0.71, 0, -7.3740, 0, 0];
wearth = [0, 0.99, 0, -6.2706, 0, 0];
wmars = [0, 1.52, 0, -5.0535, 0, 0];
wjup = [0, 5.2, 0, -2.75674, 0, 0]';
wsat = [0, 9.5, 0, -2.0383 , 0, 0];
wuran = [0, 19.22, 0, -1.4318, 0, 0];
wnep = [0, 30.02, 0, -1.1434, 0, 0];
wtroj1 = [-4.503, 2.6, 0, -1.38, -2.39, 0]';
wtroj2 = [4.503, 2.6, 0, -1.38, 2.39, 0]';


%initialize W with M number of initial condictions vectors.
W(:,1) = wsun;
W(:,2) = wmer;
W(:,3) = wven;
W(:,4) = wearth;
W(:,5) = wmars;
W(:,6) = wjup;
W(:,7) = wsat;
W(:,8) = wuran;
W(:,9) = wnep;
W(:,10) = wtroj1;
W(:,11) = wtroj2;

%RUNGE-KUTTA UPDATE RULE

[x,y,vx,vy,t] = runge_kutta(W,M,N,h,m);

%TRUNCATION ERROR FOR 4RK

[x2,y2,vx2,vy2,t2] = runge_kutta(W,M,N,2*h,m);

Ex = (x - x2)/(2^5 - 1);
Ey = (y - y2)/(2^5 - 1);

%PLOTS

figure
subplot(2,2,1)       
plot(t(1:1000),x(1:1000,2))
title('Mercury x(t)')
xlabel('Time in years')
ylabel('x distance in AU')
grid on

subplot(2,2,2)       
plot(t(1:1000), x(1:1000,3))       
title('Venus x(t)')
xlabel('Time in years')
ylabel('x distance in AU')
grid on

subplot(2,2,3)       
plot(t(1:1000), x(1:1000,4))       
title('Earth x(t)')
xlabel('Time (years)')
ylabel('x distance in AU')
grid on

subplot(2,2,4)       
plot(t(1:1000), x(1:1000,5))       
title('Mars x(t)')
xlabel('Time (years)')
ylabel('x distance in AU')
grid on

figure
subplot(2,2,1)       
plot(t(1:1000),x(1:1000,6)) 
title('Jupiter x(t)')
xlabel('Time (years)')
ylabel('x distance in AU')
grid on

subplot(2,2,2)       
plot(t(1:1000), x(1:1000,7))      
title('Saturn')
xlabel('Time (years)')
ylabel('x distance in AU')
grid on

subplot(2,2,3)       
plot(t(1:1000), x(1:1000,8))       
title('Uranus x(t)')
xlabel('Time (years)')
ylabel('x distance in AU')
grid on

subplot(2,2,4)       
plot(t(1:1000), x(1:1000,9))       
title('Neptune x(t)')
xlabel('Time (years)')
ylabel('x distance in AU')
grid on

figure
for j=1:M   
plot(t(1:1000),x(1:1000,j))
xlabel('Time (years)')
ylabel('Distance (AU)')
title('x(t) position as function of time of each planet')
hold on
grid on
end

figure
for j=1:M   
plot(x(1:1000,j),y(1:1000,j))
xlabel('x (AU)')
ylabel('y (AU)')
title('Evolution of planetary orbits after 70 years')
hold on
grid on
end

%ERROR PLOTS

 figure
 for j=1:M   
 plot(t(1:1000),Ex(1:1000,j))
 xlabel('Time (years)')
 ylabel('Trucation Error (AU)')
 title('Error of simulation for each planet after as function of time')
 hold on
 grid on
 end
 
%figure
%plot(t(1:10000), Ex(1:10000,4)-Ex_simple(1:10000,2))
%xlabel('Time (years)')
%ylabel('Error difference (AU)')
%title('Error difference between the two- and eleven-body solutions')
%grid on




