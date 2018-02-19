function [bimage] = Gray2Binary_( image , X )
    %image = imread(image);
    [W , H] = size(image);
    bimage = zeros(W,H);
    image = double(image);
    for i = 1 : W
        for j = 1 : H
            if image(i, j) > X
                bimage(i, j) = 1;
            else
                bimage(i, j) = 0;
            end                 
        end
    end
    bimage = logical(bimage);
    %figure,imshow(bimage);
end