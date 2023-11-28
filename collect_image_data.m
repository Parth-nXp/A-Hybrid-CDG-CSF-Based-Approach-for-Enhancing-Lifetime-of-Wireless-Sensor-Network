function [d N M]=collect_image_data()
A = imread('signphoto.JPG');
A = A([50:99],[50:99]);
d = double(A(:));
N = length(d);
M=1000;

