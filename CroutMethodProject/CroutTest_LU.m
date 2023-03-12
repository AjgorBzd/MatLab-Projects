% =========================================================================
% Fully written by Igor Bzdawka
%
% Function CroutTest_LU() is created to confirm whether the LU
% decomposition of a matrix A has been calculated correctly.
% 
% For a lack of MatLab-defined function decomposing the A matrix on LU
% using Crout's method, this function simply compares the result of
% decomposition by returning both L and U, as well as the difference
% between their product and the initial A.
%
% Input:
% - Matrix A
% - Vector b
%
% Output:
% - LU_diff; the difference between A and L*U,
% - L; the lower triangular matrix calculated by Crout(),
% - U; the upper triangular matrix calculated by Crout().
%
% If L and U are calculated properly, the equation A=LU, which can be
% transformed to A-LU = 0, should hold. The result of this equation is the
% LU_diff variable - it shall be close to or equal to 0. The L and U are
% also provided in the output, so that the user can confirm that they are
% indeed triangular matrices proper for Crout's method.
% 
% NOTE: If LU_diff is drastically different than 0, it may be caused
% because a matrix A cannot be decomposed into LU. 
% =========================================================================
function [LU_diff, L, U]= CroutTest_LU(A,b)
[L,U] = Crout(A,b);
LU_diff = A-L*U;
end