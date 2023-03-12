% =========================================================================
% Fully written by Igor Bzdawka
%
% Function CroutTest_x() is created to confirm whether the solution vector
% x from system of linear equations Ax=b has been calculated correctly in
% the crout() function.
% 
% The crout() function calculates the x using LU decomposition. This
% function takes the x calculated by crout(), as well as another x
% calculated by a high level function linsolve(A,b), and compares them.
%
% Input:
% - Matrix A
% - Vector b
%
% Output:
% - x_diff; the difference between x_HighLev and x_crout,
% - x_HighLev; a solution vector x calculated by x = linsolve(A,b)
% - x_crout; a solution vector x calculated by the Crout() function.
%
% If the solution vector in Crout() function is calculated properly, the
% x_diff variable shall be close to or equal to 0.
% 
% NOTE: If x_diff is drastically different than 0, it may be caused
% because a matrix A cannot be decomposed into LU. 
% =========================================================================
function [x_diff, x_HighLev, x_crout]= CroutTest_x(A,b)
[L,U,determinant,x_crout] = Crout(A,b); % L, U and determinant are irrelevant
x_HighLev = linsolve(A,b);
x_diff = x_HighLev - x_crout;
end