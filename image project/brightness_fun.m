function [new_image]=brightness_fun(A,s,choice)
    %A=imread('cameraman.tif');
    %imshow(A);
    [x,y]=size(A);
    new_image = zeros(x,y);
    A=double(A);
    if(choice=='+')
        for i=1:1:x
            for j=1:1:y
                new_image(i,j)=A(i,j)+s;
                if(new_image(i,j) > 255)
                    new_image(i,j) = 255;
                end
            end
        end
    elseif(choice=='-')
        for i=1:1:x
            for j=1:1:y
                new_image(i,j)=A(i,j)-s;
                if(new_image(i,j) < 0)
                    new_image(i,j) = 0;
                end
            end
        end
    elseif(choice=='*')
        for i=1:1:x
            for j=1:1:y
                new_image(i,j)=A(i,j)*s;
                if(new_image(i,j) > 255)
                    new_image(i,j) = 255;
                end
            end
        end 
    elseif(choice=='/')
        for i=1:1:x
            for j=1:1:y
                new_image(i,j)=A(i,j)/s;
                if(new_image(i,j) < 0)
                    new_image(i,j) = 0;
                end
            end
        end
    end
    new_image=uint8(new_image);
    %figure,imshow(new_image);
end