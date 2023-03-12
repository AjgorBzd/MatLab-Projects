function wireworld(M, n) % matrix X is the "map" of the
                         % Wireworld game. n is the
                         % repetition parameter - if n
                         % is 0, the program shall run
                         % indefinitely long, and for any
                         % positive n, it shall run n/2 seconds.

f = imagesc(M);
colormap([0,0,0;0,0.7,0.95;0.94,0.26,0.05;0.9,0.9,0.05]);
axis tight
axis equal

time = 0.5;

pause(time);
if n < 0
    return

elseif n == 0
    while true
        M = gen(M);
        f.CData = M;
        pause(time);
    end

else
    for t = 1:n
        M = gen(M);
        f.CData = M;
        pause(time);
    end

end

end