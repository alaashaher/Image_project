function grayImage = RGBToGray_fun(rgbImage)
    %rgbImage = imread(rgbImage);
    [w, h, numberOfColorChannels] = size(rgbImage);
    grayImage = zeros(w,h);
    rgbImage = double (rgbImage);
    if numberOfColorChannels  == 3
        for i = 1:w
            for j = 1:h
                grayImage(i,j)= (rgbImage(i, j, 1)+rgbImage(i, j, 2)+rgbImage(i, j, 3))/3;
            end
        end
        grayImage = uint8(grayImage);
        %imshow(grayImage),title('rgbTogray');
    else
        grayImage = rgbImage;  % Input image is not really RGB color.
    end
end