%% Prompt for image filename

%clear()
clc()

filename = input("Input image file name: ", "s");
%filename = "C:\Users\user\Documents\MATLAB\1_ENGGEN131_Project\Example Images\" + filename;
orig_image = imread(filename);

figure('Name', 'Initial image')
imshow(orig_image);

%% GreyscaleLuma.m (making RGB colour image into greyscale)

greyscale_image = GreyscaleLuma(orig_image);

figure('Name', 'Greyscale image')
imshow(greyscale_image);

%% ResizeNearest.m 

r = input("Input rows of resized image: ");
c = input("Input columns of resized image: ");
resized_dim = [r, c];

resized_orig = ResizeNearest(orig_image, resized_dim);
resized_grey = ResizeNearest(greyscale_image, resized_dim);

figure('Name', 'Resized original image')
imshow(resized_orig);

figure('Name', 'Resized greyscale image')
imshow(resized_grey);

%% AvgHash.m

AvgHash_image = AvgHash(resized_grey);

figure('Name', 'Average hash greyscale image')
imshow(AvgHash_image);

%% DiffHash.m

DiffHash_image = DiffHash(resized_grey);

figure('Name', 'Differential hash greyscale image')
imshow(DiffHash_image);

%% DispFP.m

disp("Average Hash:")
DispFP(AvgHash_image);
disp("Differential Hash:")
DispFP(DiffHash_image);

%% Close the figures

a = input("Close all figures? Y/N: ", 's');
if strcmpi(a, "y")
    close all
    disp("All visible figures closed.")
end