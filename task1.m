clc;
%read 100 image 
name='C:\Users\Mohamed\Desktop\Pattern Recognition Data Set (0-9)\Pattern Recognition Data Set (0-9)\';
centroids = zeros(1,200,100);
for i=1:100
   chr = int2str(i);
   s=strcat(name,chr,'.bmp');
  % disp(s);
  img = double(imread(s));
  img=~img;
  img=imresize(img,[100 100]);
  vector = {};
  %[r c]=size(img);
  blocks=mat2tiles(img,[10,10]);
  for j=1:10
      for k=1:10
  b=numofones(blocks(j,k));
 %disp(blocks(j,k));
 [sumx,sumy]=cinteriod(blocks(j,k));
 if b == 0
     avax = 0;
     avay = 0;
 else
     avax=sumx/b;
     avax=avax / 10;
     avay=sumy/b;
     avay = avay/10;
 end
 vector = [vector,avax,avay];
 
      end
  end
  centroids(:,:,i) = cell2mat(vector);
end
%for k = 1 :100
   % disp(centroids(:,:,k));
%end
vec=test();
answer={};
sum =0;
%calc distance
for ii=1:100
    
    for jj=1:199
       % distance=distance+temp(:,jj,ii)-vec(jj);
        temp1=centroids(:,jj,ii);
        temp2=cell2mat(vec(jj));
        temp3=centroids(:,jj+1,ii);
        temp4=cell2mat(vec(jj+1));
        res=(temp2-temp1)^2;
        res2=(temp4-temp3)^2;
        sum=sum+res+res2;  
        jj=jj+1;
     %   if distance<min
         %   min=distance;
         %   flag=ii;
       % end
    end
    distance=sqrt(sum);
    sum=0;
    % disp(distance);
     answer=[answer,distance];
    end
%get the num
for bb=1:100
    if bb==1
        mini=answer(bb);
    else
    r=answer(bb);
       if cell2mat(mini)>cell2mat(r)
            mini=r;
            final=bb;       
       else
           mini=mini;
       end
    end
end 
disp(floor(final/10));
