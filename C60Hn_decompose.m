clear%%%%decompose C60H4 to the combination of C60H2
str=load('C60H4_str.txt');
table=load('C60_table.txt');

d=nchoosek(1:4,2);

str_sub=[];
 for  ii=1:size(str,1)
     s=[];
     for ss=1:size(d,1)
     s=[s, str(ii,d(ss,1)), str(ii,d(ss,2))];
     end
     str_sub=[str_sub;s];
 end
 S=[];
 all=[];
 for jj=1:size(str_sub,1)
     for kk=1:size(str_sub,2)*0.5
         tmp=table(:,str_sub(jj,(2*kk-1):2*kk));
         for ll=1:size(tmp,1)
             tmp(ll,:)=sort(tmp(ll,:));
         end
         tmp=unique(tmp,'rows');
         ss(1,2*kk-1:2*kk)=tmp(1,:);
         all=[all;tmp(1,:)];
     end
     S=[S;ss];
 end
 all=unique(all,'rows');
  % save C60_H4_sub.txt S -ascii     
  
  
  
