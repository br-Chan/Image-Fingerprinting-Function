function [resized_image] = ResizeNearest(orig_image, resized_dim)
%This function uses the Nearest Neighbour Interpolation algorithm to resize
%an image to specified dimensions. The image can either by an RGB colour
%image or greyscale image. The algorithm involves calculating row and
%column size ratios, then finding the relative positions of each pixel of
%the resized image in the original image and eventually matching them
%together.

%Inputs:
% orig_image, R by C by p uint8 array representing an image.
% resized_dim, a 1 by 2 double array containing 2 values representing the
%desired height r and then the desired width c of the resized image.
%Output:
% resized_image, an r by c by p uint8 array representing the resized image.

%Author: Brandon Seng Han Chan

%Use size function to assign R, C and p (rows, columns & colour layers).
[R, C, p] = size(orig_image);

%Assign r and c using values from resized_dim.
r = resized_dim(1);
c = resized_dim(2);

%Pre-allocate resized_image as a uint8 array, using the dimensions in
%resized_dim and p in orig_image.
resized_image = uint8(zeros(resized_dim(1), resized_dim(2), p));

%Convert orig_image from a uint8 array into an array of doubles.
orig_image = double(orig_image);

%Calculate the row and column size ratios by dividing the original
%dimensions by the resized dimensions.
Rrow = R / r;
Rcol = C / c;

%Use a for loop to iterate through each pixel (i, j) in resized_image.
for i = 1:r
    for j = 1:c
        %Calculate the relative position (io, jo) of each pixel in
        %orig_image. Round UP the values io and jo to the nearest integer.
        io = ceil((i - 0.5) * Rrow);
        jo = ceil((j - 0.5) * Rcol);

        %Assign the value of pixel i,j in resized_image to the value of the
        %pixel io, jo in orig_image.
        resized_image(i, j, :) = orig_image(io, jo, :);

    end
end

end