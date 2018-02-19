function [ hist ] = histogram_fun( img_ )
    img_ = double(img_);
    [ h , w ] = size(img_);
    hist = zeros(256,1);
    for i = 1 : h
        for j = 1 : w
            index = img_(i,j);
            hist (index+1,1) = hist (index+1,1)+1;
        end
    end
    %bar(hist);      
end

