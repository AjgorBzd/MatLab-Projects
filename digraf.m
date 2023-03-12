function digraf(n)
if n>1
G=digraph();
nodes = n*n; 
G = addnode(G,nodes); 
diagonal = n-1;
            for i=1:n-1
G=addedge(G,i*n,n+i*n); 
G=addedge(G,n*n-n+i,n*n-n+i+1); 
G=addedge(G, n*n - n + 1 - (i-1)*diagonal , n*n - n + 1 - i*diagonal); 
            end
for i=1:n-1
    for j=1:n-1
        G=addedge(G,(i-1)*n+j,(i-1)*n+j+1); 
        G=addedge(G,(i-1)*n+j,(i-1)*n+j + n); 
    end
end
        plot(G);
end
end