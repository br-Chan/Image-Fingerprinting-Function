function [] = DispFP(fp)
%This function displays an image fingerprint in an easily readible format
%on one line, by grouping the values in groups of 8.

%Input:
% fp, a 1 by n logical row vector representing the image fingerprint.
%Output: none

%Author: Brandon Seng Han Chan

%Pre-allocate an empty character array cleanfp.
cleanfp = "";

%Convert fp to a character vector.
fp = double(fp);

%Use a for loop to iterate through each element of fp.
for i = 1:length(fp)
    %Use an if statement to determine when 8 elements have been added to
    %cleanfp (i.e. (i - 1) is divisible by 8). If it is, then add a space.
    if rem((i - 1), 8) == 0
        cleanfp = cleanfp + " ";
    end

    %Add the i'th element of fp to cleanfp (done with every iteration).
    cleanfp = cleanfp + fp(i);

end

%strip cleanfp to remove preceding whitespace and then display cleanfp.
disp(strip(cleanfp));

end