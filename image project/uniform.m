function [Img ] = uniform( Img ,  a , b )
%     Img = imread(Img);
%     figure,imshow(Img);
    [h, w] = size(Img);
    Img = double(Img);
    nump =h*w*(1/(b-a));
    for i = a:b
        for j = 1:nump
            row = floor(rand(1,1)*w)+1;
            col = floor(rand(1,1)*h)+1;
            Img(row,col) = Img(row,col)+i;
            if(Img(row,col)>255)
                Img(row,col)=255;
            end
        end
    end
    Img = uint8(Img);
%    figure,imshow(Img);

end

