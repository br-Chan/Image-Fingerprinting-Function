function [hash] = AvgHash(orig_image)
%This function uses the Average Hashing algorithm to convert a m by n
%greyscale image array into a hash containing mn bits (row vector). This is
%done by calculating an "average pixel value" of the array and representing
%each pixel as a logical 1 or logical 0.

%Input:
% orig_image, an m by n uint8 array representing a greyscale image.
%Output:
% hash, a 1 by mn logical row vector representing the average hash of the
%greyscale image.

%Author: Brandon Seng Han Chan

%Use size function to assign the number of rows & columns in orig_image.
[m, n, ~] = size(orig_image);

%Pre-allocate hash as a logical row vector, with length mn.
hash = false(1, m*n);

%Calculate the average value Pavg of the pixels in orig_image. Round it
%to the nearest integer.
Pavg = round(mean(orig_image, "all"));

e = 1; %e dictates the current element in hash to add a logical to.

%Use a for loop to iterate through each pixel in orig_image.
for i = 1:m
    for j = 1:n
        %Use an if statement to compare the pixel to Pavg and set the
        %current element in hash to logical 1 or 0 accordingly.
        if orig_image(i, j) >= Pavg
            hash(e) = true;
        elseif orig_image(i, j) < Pavg
            hash(e) = false;
        end

        %Raise e so the next logical is added to the next element in hash.
        e = e + 1;

    end
end

end