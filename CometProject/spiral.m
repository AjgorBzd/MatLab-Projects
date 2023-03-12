R=120;
r=50;
% R stands for the big radius of the torus, around which the two points revolve.
% r stands for the difference between the big and small torus radius.
% These values can be changed, but cases where r > R give weird results
N = 1000;
phi=linspace(0,2*pi,N);
% phi is a set of N points dividing interval between 0 and 2pi on equal
% pieces. These points are going to be the arguments of the functions of
% helices.
% The bigger the N, the bigger the accuracy of the helices and, as a
% result, the slower the points move (each step is closer to the next one
% because there are more points on the same interval)

% coordinate function of the black helix
x = (R+r.*cos(R*phi)).*cos(phi);
y = (R+r.*cos(R*phi)).*sin(phi);
z = r.*sin(R*phi);

% coordinate function of the red helix (moved by half of the sin/cos period)
x2 = (R+r.*cos(R*phi+pi)).*cos(phi);
y2 = (R+r.*cos(R*phi+pi)).*sin(phi);
z2 = r.*sin(R*phi+pi);

% setup of the figure window
axis equal
axis padded
grid on
view(45,30)

xlabel('x')
ylabel('y')
zlabel('z')

hold on
plot3(x,y,z,'Color',[0,0,0]) % black spiral
plot3(x2,y2,z2,'Color',[1,0,0]) % red spiral
bdot = scatter3(x(1),y(1),z(1),'black'); % defining the black dot
rdot = scatter3(x2(1),y2(1),z2(1),'red'); % defining the red dot

    % animation
    while true % repeating the cycle endlessly
        for f=1:N % one whole cycle
            bdot.XData = x(f);
            bdot.YData = y(f);
            bdot.ZData = z(f);
            rdot.XData = x2(f);
            rdot.YData = y2(f);
            rdot.ZData = z2(f);
        
        drawnow
        %pause(0.002)
        end
    end