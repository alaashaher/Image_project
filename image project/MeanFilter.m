function N_I = MeanFilter( I )
%I = imread(I);
 imshow(I);
I = double(I);

Mask = 1/9*[1 1 1;1 1 1;1 1 1];
N_I = filter2(rot90(I,2),Mask,'full');
%N_I = conv2(Mask,rot90(I,2),'full');
figure,imshow(uint8(N_I));
end
 

