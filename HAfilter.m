function [filtered]=HAfilter(image,filter)
% HAfilter(the image, filter to apply)--- To apply any 3x3 filter with padding 
image=cast(image,'double'); %convert the data type to double istead of uint8 integers
imsh=size(image); %image shape
filsh=size(filter); %filter shape

upperro=image(1,:);
loerro=image(imsh(1),:);
left=image(:,1);
right=image(:,imsh(2));


% find the corners
upperrosh=size(upperro);
loerrosh=size(loerro);
leftsh=size(left);
rightsh=size(right);

if upperro(1) > left(1)  UL =upperro(1); else UL=left(1); end %UL 'upper left' number=the first number of upper row if it's larger than first element of left colomn
if upperro(upperrosh(1)) > right(1) UR =upperro(upperrosh(1));else UR=right(1); end
if loerro(1) > left(leftsh(1))  LL =loerro(1); else LL=left(leftsh(1)); end
if loerro(loerrosh(1)) > right(rightsh(1)) LR =loerro(loerrosh(1));else LR=right(rightsh(1)); end

% add UR and LR to right colomn
right=[UR;right;LR];
% add UL and LL to left colomn
left=[UL;left;LL];

% stak the padded image
small_image=[upperro;image];
small_image=[small_image;loerro];
small_image=[left,small_image];
small_image=[small_image,right];
small_imagesh=size(small_image);

% Now aplly filter
filtered=zeros(small_imagesh(1),small_imagesh(2));
for Rinst=[0:small_imagesh(1)-filsh(1)]
rowcut=small_image(1+Rinst:filsh(1)+Rinst,:);
for st=[0:small_imagesh(2)-filsh(2)]
      colcut=rowcut(:,1+st:filsh(2)+st);
      multiply=colcut.*filter;
      filtered(Rinst+1,st+1)=sum(multiply,'all');
end
end 
filtered=filtered(1:imsh(1),1:imsh(2));
filtered=cast(filtered,'uint8');