function [sumx ,sumy]= cinteriod( arr )
sumx=0;
sumy=0;
temp=cell2mat(arr);
for i=1:10
    for j=1:10
       sumx=sumx+(i*temp(i,j));
       sumy=sumy+(j*temp(i,j));
    end
end
       
end

