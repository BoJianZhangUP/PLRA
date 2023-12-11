function S=multi_region_Gaussian(X,m,n)
[x,y]=size(X);
area=x+y;

sigma=ceil(area/12);
% sigma=ceil(area/2); IF CROP
 S=zeros(x,y);
    for i=1:x
        for j=1:y
            S(i,j)=(1/(2*pi*sigma^2))*exp(-((i-m)^2+(j-n)^2)/(2*sigma^2));
        end
    end
end