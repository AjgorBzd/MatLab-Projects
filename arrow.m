a=100;
p1 = [0 0];                         
p2 = [5*a 0];                         
dp = p2-p1;
p2start=[5*a 0];
figure
quiver(p1(1),p1(2),dp(1),dp(2),0)
axis([-5*a 5*a   -5*a  5*a])
for i=0:0.03:2*pi
    M=[cos(i),-sin(i);sin(i),cos(i)];
    p2=p2start;
    p2=p2*M;
    dp = p2-p1;
    pause(0.1);
    quiver(p1(1),p1(2),dp(1),dp(2),0)
    axis([-5*a 5*a   -5*a  5*a])
end