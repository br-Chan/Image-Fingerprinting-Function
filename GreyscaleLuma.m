function [greyscale_image] = GreyscaleLuma(orig_image)
%This function converts an input RGB colour image to a greyscale version by
%calculating a weighted sum for each pixel, then assigning the value of
%this pixel to a new image array.
%Input: orig_image, an m by n by 3 uint8 array representing an RGB image.
%Output: greyscale_image, an m by n by 1 uint8 array representing the
%greyscale image converted from orig_image.

%Author: Brandon Seng Han Chan

%Assign the number of rows & columns in orig_image. rows = m, columns = n
[rows, columns, ~] = size(orig_image);

%Pre-allocate greyscale_image as a 2D uint8 array. This means conversion at
%the end of the function is not needed as it is already in uint8 format.
greyscale_image = uint8(zeros(rows, columns, 1));

%Convert orig_image from a uint8 array into an array of doubles.
orig_image = double(orig_image);

%Use a for loop to iterate through every pixel in orig_image, and
%calculate the grey pixel value pg for each pixel.
for i = 1:rows
    for j = 1:columns
        %Calculate pg with the formula and RGB values of the current pixel.
        pg = 0.2126*orig_image(i, j, 1) + 0.7152*orig_image(i, j, 2) ...
        + 0.0722*orig_image(i, j, 3);

        %Assign the respective pixel in greyscale_image the pg value.
        greyscale_image(i, j) = pg;

    end
end

end