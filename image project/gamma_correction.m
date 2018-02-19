function [ new_image ] = gamma_correction( old_image , Gamma )
    [w,h,z] = size(old_image);
    %imshow(old_image);
    new_image = zeros(w,h,z);
    old_image = im2double(old_image);
    for i = 1:w
        for j = 1:h
            for s = 1:z
                new_image(i,j,s)=old_image(i,j,s)^Gamma;
            end
        end
    end
    %new_image = logical(new_image);
    %figure,imshow(new_image);
end



