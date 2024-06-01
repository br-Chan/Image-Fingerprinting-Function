# Image Fingerprinting Function

A comprehensive image fingerprinting function that hashes images into binary image fingerprints. These fingerprints are then used to compare the similarities of different images, and rank them in a list of decreasing similarity.

The following algorithm converts a typical image into its hashed image fingerprint:
1. Convert the image to greyscale - the result is a single array of uint8 values.
2. Reduce the image size using one of two different methods (ResizeNearest.m or ResizeBox.m).
3. Convert the image array to a hash of 1s and 0s using one of two different methods (AvgHash.m or DiffHash.m).

The 'hamming distance' between image fingerprints is calculated - the smaller the distance, the more similar the images are.

As a demo, I'm using two scripts: one that demonstrates the process from original image to hashed fingerprint, and one that demonstrates the calculation and sorting of hamming distances (this particular script was provided to me).

[Coming soon]

