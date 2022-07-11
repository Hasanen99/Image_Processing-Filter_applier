cman=imread('cameraman.tif'); %size=(256,256)
% cman=cast(cman,'double')
fl=[[ 1,  0, -1];[ 2,  0, -2];[ 1,  0, -1]];
smoo=[[ 1/9,  1/9, 1/9];[ 1/9,  1/9, 1/9];[ 1/9,  1/9, 1/9]];
shar=[[ -1,  -1, -1];[ -1,  5, -1];[ -1,  -1, -1]];
class(cman)
cnew=HAfilter(cman,smoo);
csharp=HAfilter(cnew,shar);
% cnew=cast(cnew,'uint8')
size(csharp)
subplot(1,3,1)
imshow(cman)
title('Original image')
subplot(1,3,2)
imshow(cnew)
title('Average smoothed image')
subplot(1,3,3)
imshow(csharp+cman)
title('Sharped image')

