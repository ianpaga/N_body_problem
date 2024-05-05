function [g] = g_function(t,W,M,m)
%DESCRIPTION OF FUNCTION
%This function takes as input the initial conditions and the parameters
%needed to compute the forces acting on all bodies. Newton's second law is
%implemented for each particle, rulling out auto-interation and
%divergences.

%PARAMETERS

G = 4*(pi*pi);   %gravitational constant
pos = W(1:3,:); %position vector
vel = W(4:6,:); %velocity vector
g = zeros(6, M);    %matrix output of g_function
suncorrection = zeros(3,1); %Sun rest frame correction

r = 0.0;
R = 0.0;

%NEWTONS SECOND LAW 

for i=1:length(pos)
    sum = zeros(3,1);
      
    for j=1:length(pos)
        if j~=i && i==1
            R = norm(pos(:,i)-pos(:,j));
            suncorrection = suncorrection - G*m(j)*(pos(:,i)-pos(:,j))/(R*R*R); 
        end
        if j~=i
            r = norm(pos(:,i)-pos(:,j));
            sum = sum - G*m(j)*(pos(:,i)-pos(:,j))/(r*r*r);   
        end
    end
    g(1:3,i) = vel(:,i);
    g(4:6,i) = sum; %- suncorrection;
    
    
end



end

