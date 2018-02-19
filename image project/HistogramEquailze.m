function [ Result ] = HistogramEquailze(Image)
    hist=histogram_fun(Image);
    %bar(hist);
    CDF=zeros(256,1);    %define array CDF 
    NCDF=zeros(256,1);   %define array new CDF

    % Calculate CDF 
    CDF(1) = hist(1);
    for i=2:256
            CDF(i)= CDF(i-1)+hist(i);
    end 

    % Normalize CDF
    oldMinCDF = CDF(1);
    oldMaxCDF = max(max(CDF));
    for i=2:256

            NCDF(i,1) = ((CDF(i,1)- oldMinCDF )/(oldMaxCDF- oldMinCDF )); 
            NCDF(i,1) = NCDF(i,1)*255;
    end
    Result=NCDF;
    %figure,bar(Result);
end 