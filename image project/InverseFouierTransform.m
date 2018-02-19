function [ I ] = InverseFouierTransform( FI )

FI = fftshift(FI);
I = ifft2(FI);

end

