function [ imgb ] = rgbtobinary( img , x )
    %img =  imread(img);
    %figure,imshow(img);
    [w,h,ch] = size(img);
    img = double(img);
    imgb=zeros(w,h);
    if (ch==3)
       for i = 1:w
           for j =1:h
               if(img(i,j)>x)
                   imgb(i,j)=1;
               else
                   imgb(i,j)=0;
               end
           end
       end
    end
    imgb=logical(imgb);
    %figure,imshow(imgb);
end

