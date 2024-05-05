function [x,y,vx,vy,t] = runge_kutta(W,M,N,h,m)
%4th-order-Runge-Kutta Method. This function takes as input the the initial
%conditions and parameters specified in the main program. Also, calls the
%function g_function, and evaluates it at different points to obtain good
%estimators. The outputs are the the new positions and velocities while
%updating the time accordingly.


t = zeros(N,1);
x = zeros(N,M);
y = zeros(N,M);
vx = zeros(N,M);
vy = zeros(N,M);


for n=1:N-1
  
    a = g_function(t(n), W, M,m);
    b = g_function(t(n)+ h/2, W + a*h/2, M,m);
    c = g_function(t(n)+ h/2, W + b*h/2, M,m);
    d = g_function(t(n)+ h, W + c*h, M,m);
    
    W = W + 1/6*h*a + 1/3*h*b + 1/3*h*c + 1/6*h*d; 
    
    t(n+1)= t(n) + h;
    
    x(n,:)  = W(1,:);
    y(n,:)  = W(2,:);
    vx(n,:) = W(4,:);
    vy(n,:) = W(5,:);
    

    
end


end

