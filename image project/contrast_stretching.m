function [ new_image ] = contrast_stretching( old_image ,min_new,  max_new )
    %old_image = imread(old_image);
    imshow(old_image);
    [w,h,z] = size(old_image);
    min_old = min(min(old_image));
    max_old = max(max(old_image));
    new_image = zeros(w,h,z);
    old_image = double (old_image);
    for i = 1:w
        for j = 1:h
            for s = 1:z
                a=((old_image(i,j,s)-min_old)./(max_old-min_old));
                new_image(i,j,s) = a*((max_new-min_new)+min_new);
            end
        end
    end
    new_image = uint8(new_image);
    figure,imshow(new_image);

end