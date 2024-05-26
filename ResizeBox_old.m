function [resized_image] = ResizeBox_old(orig_image, resized_dim)
%This function uses the Box Sampling Algorithm to resize an image to the
%specified dimensions. This is done by calculating the average pixel value
%in a group of pixels in the original image, and assigns this average value
%to the corresponding pixel in the resized image.

%Inputs:
% orig_image, R by C by p uint8 array representing an image.
% resized_dim, a 1 by 2 double array containing 2 values representing the
%desired height r and then the desired width c of the resized image.
%Output:
% resized_image, an r by c by p uint8 array representing the resized image.

%Author: Brandon Seng Han Chan

%Use size function to assign R, C and p (rows, columns & colour layers).
[R, C, p] = size(orig_image);


r = resized_dim(1);
c = resized_dim(2);

resized_image = uint8(zeros(resized_dim(1), resized_dim(2), p));

orig_image = double(orig_image);

%Use a for loop to iterate through every bounding box (every bounding line
%column and row on the left and above).
for i = 0:R/r:(R-R/r)
    %Find the topmost pixel row by adding 1 and rounding i. BUT if bounding
    %line is exactly halfway, topmost pixel is ceiling of i.
    if rem(i, 1) == 0.5
        toprow = ceil(i);
    else
        toprow = round(i + 1);
    end

    %Find the bottommost pixel row by rounding the bottom bounding line.
    botrow = round(i + R/r);

    for j = 0:C/c:(C-C/c)
        %Find leftmost pixel column by adding 1 and rounding j. BUT if
        %bounding line is exactly halfway, leftmost pixel is ceiling of j.
        if rem(j, 1) == 0.5
            leftcol = ceil(j);
        else
            leftcol = round(j + 1);
        end

        %Find rightmost pixel column by rounding the right bounding line.
        rightcol = round(j + C/c);

        %Iterate through each pixel in current bounding box to add them to
        %a separate array.
        a = [];
        for m = toprow:botrow
            for n = leftcol:rightcol
                a = [a, orig_image(m, n, :)];
            end
        end

        %Add the mean of the values in the bounding box to the
        %corresponding element in resized_image.
        resized_image(round(i*r/R+1), round(j*c/C+1), :) = mean(a);

    end
end

end