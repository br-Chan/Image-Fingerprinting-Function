function [ham] = HammingDistance(fp1, fp2)
%This function compares two image fingerprints and determines the number of
%positions at which the corresponding values differ (i.e. the hamming
%distance). It is assumed that the fingerprints have the same length.

%Inputs:
% fp1, a 1 by n logical row vector representing an image fingerprint.
% fp2, a 1 by n logical row vector representing an image fingerprint.
%Output:
% ham, an integer representing the number of differing bits between fp1 and
%fp2.

%Author: Brandon Seng Han Chan

ham = 0;

%Use a for loop to run through each of the fingerprints' values, checking
%the i'th elements of both to see if they differ.
for i = 1:length(fp1)
    if fp1(i) ~= fp2(i)
        ham = ham + 1;
    end

end

end