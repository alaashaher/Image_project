function [img1 ] = gussian( img,a )


[w,h]=size(img);
img1=double(img);
for i=0:255
     nump=uint8((a*(exp(-a+i))*w*h));%%% Yuki %%%
  %  nump=unit8(nump);
     for j=0 : nump 
         row = randi(w,1,1);%%% Yuki %%%
         col = randi(h,1,1);%%% Yuki %%%
         img1(row,col)=img1(row,col)+i;
    end
end

%figure,imshow(uint8(img1));%%% Yuki %%%

end

