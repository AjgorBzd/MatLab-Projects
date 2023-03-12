% =========================================================================
% Fully written by Igor Bzdawka
%
% The CroutTest() function is a function created to confirm
% the correctness of the Crout() function implementation. As an input, it
% takes a matrix A and constant terms vector b.
%
% The output of this function is:
% - L and U - products of Crout's LU decomposition of A,
% - de - determinant of A (high-level),
% - x - solution of equation Ax=b (high-level),
% - det_diff - the difference between the determinants calculated using
%              CroutTest_det() function,
% - x_diff - the difference between the solution vectors calculated using 
%            CroutTest_x() function.
% - lu_diff - the difference between the initial A matrix and the product 
%             of L and U, calculated using CroutTest_LU() function.
%
% The CroutTest() function is a one big testing function, combining
% CroutTest_det, CroutTest_x and CroutTest_LU. The last 3 output variables,
% being det_diff, x_diff and lu_diff, indicate whether the implementation 
% was correct or not, all in one function.
%
% The format of this function both lets the user see all the information
% about the LU decomposition, all at once, and is created for the
% RandomComparator. If user wants to input their own matrices A and b,
% they should use this function, and if the user prefers to see a random
% output, they should use the RandomComparator().
% =========================================================================
function [L,U,determinant,x,det_diff,x_diff,lu_diff] = CroutTest(A,b)
[lu_diff, L, U] = CroutTest_LU(A,b);
[det_diff, determinant] = CroutTest_det(A,b);
[x_diff, x] = CroutTest_x(A,b);
end