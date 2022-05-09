function PPout = Jpeg2pointsConverter(BB, Threshold)
    BB1=BB(:,:,1);
    [M, N]= size(BB1);
    BB1=double(BB1);
    BB2 = 255-BB1; %Invert so white is 0 instead of 255
    BB3 = (BB2 > Threshold);  %Any point with high value is replaced by 1, and 
                        %any point with a low value is replaced by 0
                        
    PP=zeros(2,M*N);
    cnt=0;
    for ii=1:M
        for jj=1:N
            if (BB3(ii,jj)>0.5)
                PP(:,cnt+1)=[jj;N-ii];
                cnt=cnt+1;
            end
        end
    end
    PPout = PP(:,1:cnt);
end