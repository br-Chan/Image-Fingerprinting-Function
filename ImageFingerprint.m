function [fp] = ImageFingerprint(orig_image, hash, resize)
%This function creates a 64-bit image fingerprint using the specified
%hashing and resizing algorithm for a given colour image.

%Inputs:
% orig_image, an m by n uint8 array representing a colour image.
% hash, a character vector containing either 'AvgHash' or 'DiffHash' that
%is used to determine what kind of hashing algorithm to use.
% resize, a character vector containing either 'Nearest' or 'Box' that is
%used to determine what kind of resizing algorithm to use.
%Output:
% fp, a 1 by 64 logical row vector representing the image fingerprint.

%Author: Brandon Seng Han Chan

%Assign the double array resized_dim (height and width of the resized
%image) to be used in the resizing algorithm.
if strcmp(hash, 'DiffHash')
    %Set resized_dim to have 9 columns so that DiffHash creates a 1 by 64
    %image fingerprint.
    resized_dim = [8 9];
else
    resized_dim = [8 8];
end

%Use GreyscaleLuma to turn the image into a greyscale image.
greyscale_image = GreyscaleLuma(orig_image);

%Use an if statement and the resize input to determine what resizing
%algorithm to use, then apply it.
if strcmp(resize, 'Nearest')
    resized_image = ResizeNearest(greyscale_image, resized_dim);
elseif strcmp(resize, 'Box')
    resized_image = ResizeBox(greyscale_image, resized_dim);
end

%Use an if statement and the hash input to determine what hashing algorithm
%to use, then apply it.
if strcmp(hash, 'AvgHash')
    fp = AvgHash(resized_image);
elseif strcmp(hash, 'DiffHash')
    fp = DiffHash(resized_image);
end

end