function O = gen(I) % generation of electrons
O = I; % O - output, I - Input
O(I == 1) = 2; % Heads become Tails
O(I == 2) = 3; % Tails become Conductors

OH = I; % OH - OnlyHeads
OH(I == 3) = 0;
OH(I == 2) = 0; % Eliminating Conductors and Tails

K = ones(3); % K - Kernel of convolution
K(2,2) = 0; % the cell cannot be its own neighbor
Convo = conv2(OH,K,'same'); % - calculate the number of
                            %   neighboring heads for every
                            %   cell of the matrix

O(I == 3 & (Convo == 1 | Convo == 2)) = 1; % Conductors become Heads sometimes
end

