% =========================================================================
% Fully written by Igor Bzdawka
%
% Function CroutTest_det() is created to confirm whether the determinant of
% the matrix A has been correctly calculated in Crout() function.
% 
% The Crout() function calculates determinant from the product of the
% entries in the main diagonal of L. We compare this result with high
% level, MatLab defined function det().
%
% Input:
% - Matrix A
% - Vector b
%
% Output:
% - det_diff; the difference between det_HighLev and det_crout,
% - det_HighLev; a determinant calculated by a high level function det(),
% - det_crout; a determinant calculated by the Crout() function.
%
% If the determinants calculated in Crout() is correct, the det_diff
% variable shall indicate a number equal to or close to 0.
% 
% NOTE: If det_diff is drastically different than 0, it may be caused
% because a matrix A cannot be decomposed into LU.
% =========================================================================
function [det_diff, det_HighLev, det_crout]= CroutTest_det(A,b)
[L,U,det_crout] = Crout(A,b); % L and U are irrelevant
det_HighLev = det(A);
det_diff = det_HighLev - det_crout;
end