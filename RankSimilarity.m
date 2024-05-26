function [] = RankSimilarity(fp, filenames, collection, n)
%This function displays n image files ranked by descending similarity, each
%image file name displayed with the rank number and hamming distance. Lines
%are processed so that the rank numbers and hamming distances are
%right-jutified, and the file names are left-justified.

%Inputs:
% fp, a 1 by 64 row vector representing the image fingerprint to search.
% filenames, an m by 1 string array representing a list of image file
% names.
% collection, an m by 1 cell array containing a collection of image
% fingerprints.
% n, an integer denoting how many image fingerprints to display.
%Outputs: none

%Author: Brandon Seng Han Chan

%Use a for loop to calculate the hamming distances of the searched
%fingerprint from every image in the collection, and process them into a
%separate array.
hamlist = [];
for i = 1:length(filenames)
    ham = HammingDistance(fp, collection{i});

    if length(int2str(ham)) == 1
        ham = "  " + ham; %2 spaces before ham
    else
        ham = " " + ham; %1 space before ham if ham is 2 digits
    end

    hamlist = [hamlist; ham];
end

%Sort the hamming distances and file names in ascending order.
[hamsorted, hamorder] = sort(hamlist); %Here, ties are broken by indices
namesorted = filenames(hamorder);

rankname = hamsorted + " - " + namesorted;

%Use a for loop to display each ranking.
maxdigits = length(int2str(n)); %Number of digits in n
rank = "";
for i = 1:n
    %Use a for loop to add the right number of spaces.
    curdigits = length(int2str(i)); %Number of digits in i
    for j = 1:(maxdigits-curdigits)
        rank = rank + " ";
    end

    rank = rank + i + "." + rankname(i);
    disp(rank);
    rank = "";
end

end