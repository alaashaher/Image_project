function [ Img] = salt_and_papper_noise( Img,ps,pp )
   % Img = imread(Img);
    imshow(Img);
    [h, w] = size(Img);
    nums=ps*h*w;
    nump=pp*h*w;
    Img = double(Img);
    for i=1:nums
        row = round(rand(1,1)*w)+1;
        col = round(rand(1,1)*h)+1;
        Img(row,col)=255;
    end
    for i = 1 :nump
        row = round(rand(1,1)*w)+1;
        col = round(rand(1,1)*h)+1;
        Img(row,col)=0;
    end
    Img = uint8(Img);
    figure,imshow(Img);
end

