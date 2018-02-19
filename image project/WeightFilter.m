function N_I = WeightFilter( I )
%I = imread(I);
 imshow(I);
I = double(I);
Mask=[1/16 1/8 1/16;1/8 1/4 1/8;1/16 1/8 1/16];
N_I = filter2(rot90(I,2),Mask,'full');
N_I = uint8(N_I);
figure,imshow(N_I);
end

