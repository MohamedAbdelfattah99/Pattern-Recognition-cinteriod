function [ num ] = numofones( block )
counter=0;
temp=cell2mat(block);
   for i=1:10
        for j=1:10
        if temp(i,j)==1
          counter=counter+1;
        end
        end
   end

num=counter;

end

