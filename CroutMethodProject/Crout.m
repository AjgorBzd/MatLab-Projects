 % =========================================================================
% Fully written by Igor Bzdawka
%
% A Matlab implementation of 
% LU decomposition of a square matrix 
% following Crout's method, additionally 
% solving the system of linear equations
% Ax=b, after substituting A with LU.
% 
% The input of the function is:
% - A - a matrix system of linear equations,
% - b - a vector of constant terms.
%
% The output of the function is:
% - L - a lower-triangular matrix,
% - U - an upper-triangular matrix with all entries in the main diagonal
%       equal to 1 (Crout's method condition),
% - determinant - the determinant of a matrix A,
% - x - the solution vector of an equation Ax=b.
% 
% Crout's substitution replaces A with a product of two matrices L and U,
% such that A=L*U. As said above, the U's main diagonal consists of 1's
% only. Next, it calculates the equation Ax=b in a following manner:
% Ax=b
% ↓
% A=LU → LUx=b
% So, to solve this equation we substitute Ux with y and calculate the
% following in this order:
% 1. Ly=b for y,
% 2. Ux=y for x.
% 
% The way the program works can be divided into steps:
% STEP 1 - Initializing the output variables
% STEP 2 - Checking for method limitations
% STEP 3 - Filling matrices L and U from equation A=LU
% STEP 4 - Calculating determinant
% STEP 5 - Solving equation Ly=b for y
% STEP 6 - Solving equation Ux=y for x
% =========================================================================

function [L,U,determinant,x] = Crout(A,b)
matsize=size(A,1); % defining the size of matrix A

% === STEP 1 - Initializing the output variables ===
% This step creates output matrices to avoid repeated dynamic allocation
% of them during the process of the program. The creation of the matrices
% also allows for premature return of a process in step 2.
L=zeros(matsize,matsize);
U=zeros(matsize,matsize);
x=zeros(matsize,1);
determinant = 0;

% === STEP 2 - Checking for method limitations ===
% Crout's method requires that the matrix A is a square matrix of size n by
% n, and the matrix b is a vector n by 1. If either of them occurs, the
% program shall return 0's in every variable.
if size(A,1) ~= size(A,2) % checking if A is a square matrix
    return;
end

if size(b,1) ~= matsize % checking if b is of the same size as A
    return;
end


% === STEP 3 - Filling matrices L and U from equation A=LU ===
% The fully explained way of figuring out how to fill matrices L and U will
% be provided in the report, for the sake of the length of the explanation.
% For a brief start of filling, the U matrix's main diagonal is filled with
% 1's. Also, for any matrix decomposition, the first column of L is the
% same as the first column of A. Additionally, the first row of U, apart
% from the first entry of this row, is a quotient of the corresponding
% entry in A and the entry A(1,1).

for i=1:matsize
    U(i,i)=1; % the diagonal of U are 1's only
    L(i,1)=A(i,1); % after decomposition, the first column of L is the
                   % same as the first column of A
end
for i=2:matsize
    U(1,i)= A(1,i)/A(1,1); % first row of U is a quotient of the first
                           % row of A and the A(1,1)
end

for i=2:matsize

    % filling L matrix...
    for j=2:i
        L(i,j)=A(i,j);
        for k=1:(j-1)
            L(i,j)=L(i,j)-L(i,k)*U(k,j);
        end
    end
    
    if L(i,i) == 0
        L=zeros(matsize,matsize);
        U=zeros(matsize,matsize);
        return;
    end
    
    % ...simultaneously filling U matrix 
    if i<matsize
        for j=i+1:matsize
        U(i,j)=A(i,j);
        for k=1:i-1
            U(i,j)=U(i,j)-L(i,k)*U(k,j);
        end
        U(i,j)=U(i,j)/L(i,i);
        end
    end

end

% === STEP 4 - Calculating determinant ===
% The determinant of A is calcuated as following:
% det(A) = det(LU) = det(L)*det(U) = det(L)*1 = det(L)
% Since L and U are triangular matrices, their determinants are equal to
% a product of all their main diagonal entries. And since the determinant
% of U is a product of 1's, det(U) = 1.

determinant=1;
for i=1:matsize
    determinant=determinant*L(i,i);
end

% === STEP 5 - Solving equation Ly=b for y ===
% This step is being solved using forward substitution. The mathematical
% desctiption of this process for Crout's L matrix looks as follows:
% y(i) = (b(i) - (sum for j from 1 to i-1 of (L(i,j)*y(j))) / L(i,i)),
% where n stands for the size of one dimension of A. i goes from 1 to n.

y=zeros(matsize,1); % initialising y
for i=1:matsize % forward substitution
    y(i) = b(i);
    for j=1:i-1
        y(i) = y(i) - L(i,j) * y(j);
    end
    y(i) = y(i) / L(i,i);
end

% === STEP 6 - Solving equation Ux=y for x ===
% This step is being solved using backward substitution. The mathematical
% description of this process for Crout's U matrix looks as follows:
% x(i) = y(i) - (sum for j from i+1 to n of (x(j)*U(i,j))) where n stands
% for the size of one dimension of A. Here, i decreases from n to 1.
tic
x=zeros(matsize,1);
for i=matsize:-1:1
    x(i) = y(i);
    for j=i+1:matsize
        x(i) = x(i) - x(j)*U(i,j);
    end
end
toc
end