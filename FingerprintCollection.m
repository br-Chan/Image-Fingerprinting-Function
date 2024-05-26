function [collection] = FingerprintCollection(filenames, hash, resize)
%This function stores all of the image fingerprints from a list of image
%filenames so they can be quickly looked up for comparison.

%Inputs:
% filenames, an m by 1 string array representing a list of image file
% names
% hash, a character vector containing either 'AvgHash' or 'DiffHash'.
% resize, a character vector containing either 'Nearest' or 'Box'.
%Output:
% collection, an m by 1 cell array containing the fingerprint from each
% image file.

%Author: Brandon Seng Han Chan

collection = {};

%Use a for loop to iterate through each filename.
for i = 1:length(filenames)
    %Obtain the image array from the file.
    orig_image = imread(filenames(i));

    %Convert the image array into a 1 by 64 fingerprint and add to
    %collection.
    collection = [collection; ImageFingerprint(orig_image, hash, resize)];

end

end