function [ img__ ] = negative_fun( img_ )
    %img_ = imread(img_);
    [ h , w ] = size(img_);
    img__ = zeros(h,w);
    img_ = double(img_);
    for i = 1 : h
        for j = 1 : w
            img__(i,j) = 255-img_(i,j);
        end
    end
    img__ = uint8(img__);
    %figure,imshow(img__);

end

