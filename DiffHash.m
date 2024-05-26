function [hash] = DiffHash(orig_image)
%This function converts an m by (n+1) greyscale image array into a hash
%containing mn bits using the Differential Hashing algorithm. This is done
%by comparing each pixel value to the pixel value to the right of itself in
%the greyscale image.

%Input:
% orig_image, an m by (n+1) uint8 array representing a greyscale image.
%Output:
% hash, a 1 by mn logical row vector representing the differential hash of
%the greyscale image.

%Author: Brandon Seng Han Chan

%Use size function to assign the number of rows & columns in orig_image.
[m, n, ~] = size(orig_image);
n = n - 1; %n is lowered so that the width of orig_image is (n+1).

%Pre-allocate hash as a logical row vector, with length mn.
hash = false(1, m*n);

e = 1; %e dictates the current element in hash to add a logical to.

%Use a for loop to iterate through each pixel in orig_image, excluding the
%rightmost column of pixels.
for i = 1:m
    for j = 1:n
        %Compare the pixel to the one to the right of it and set the
        %current element in hash to logical 1 or 0 accordingly.
        if orig_image(i, j) >= orig_image(i, j+1)
            hash(e) = true;
        elseif orig_image(i, j) < orig_image(i, j+1)
            hash(e) = false;
        end

        %Raise e so the next logical is added to the next element in hash.
        e = e + 1;
        
    end
end

end