function [ filter_image ] =high_guassian( img,d0 )
    imshow(img);
fi=fft2(img);

    fi=fftshift(fi);
    nreal=real(fi);
    nimag=imag(fi);
    [h ,w]=size(img);
    filter=zeros(h,w);

    for i=1:h
        for j=1:w
            d=sqrt((i-h/2)^2+(j-w/2)^2);
            filter(i,j)=1-exp((-d^2)/(2*d0)^2);

        end
    end
    for i=1:h
        for j=1:w
            nreal(i,j)=nreal(i,j)*filter(i,j);
            nimag(i,j)=nimag(i,j)*filter(i,j);
            NI(i,j)=nreal(i,j)+sqrt(-1)*nimag(i,j);
        end
    end
    %nreal=nreal*filter
    %nimag=nimag*filter
    %NI=nreal+i*nimag
    NI=fftshift(NI);
    NI=ifft2(NI);
    z=mat2gray(abs(NI));
    filter_image=z;
    figure,imshow(filter_image);
end



