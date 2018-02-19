function [ new_image ] = log_transformation(old_image)
    c=1;
    %imshow(old_image);
    [w,h,z] = size(old_image);
    new_image = zeros(w,h,z);
    old_image = im2double(old_image);
    for i = 1:w
        for j = 1:h
            for s = 1:z
                n=1+old_image(i,j,s);
                f=log10(n);
                new_image(i,j,s)=c*f;
            end
        end
    end
    %new_image = uint8(new_image);
    %figure,imshow(new_image);
end



