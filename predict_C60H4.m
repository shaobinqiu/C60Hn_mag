% %predit the mag of C60H4
clear
tic
str=load('C60H4_str.txt');
table=load('C60_table.txt');
E_ud0=load('energy_ud0');%2-24
E_ud2=load('energy_ud2');%2-24
E_diff=E_ud2(:,4)-E_ud0(:,4);
str_123=load( 'C60_str.txt');%C60H1.2.3
d=nchoosek(1:4,2);
% toc
% tic
%  table_H2=zeros(60,60);
%  all_H2=[];
%  for ii=1:60
%      for jj=1:60
%            s=table(:,[ii,jj]);
%          for ll=1:size(s,1)
%              s(ll,:)=sort(s(ll,:));
%          end
%          s=unique(s,'rows');
%          
%          for kk=2:24
%              if s(1,:)==str_123(kk,1:2)
%                  table_H2(ii,jj)=kk;
%              end
%          end
%              all_H2=[all_H2;s(1,:)];
%      end
%  end
%     save table_H2.txt table_H2 -ascii  %%%    the table to find C60H2 fast
%  toc
%  tic
table_H2=load('table_H2.txt');
 str_sub=[];
 for  ii=1:size(str,1)
     s=[];
     for ss=1:size(d,1)
     s=[s, table_H2(str(ii,d(ss,1)), str(ii,d(ss,2)))];
     end
     str_sub=[str_sub;s];
 end
m=[0:2^4-1];
mag_str=dec2bin(m);
mag=[];
E_pre_str=[];
for ii=1:size(mag_str,1)*0.5
    mag=[mag;abs(2*(str2num(mag_str(ii,1))+str2num(mag_str(ii,2))+str2num(mag_str(ii,3))+str2num(mag_str(ii,4)))-4)];
    e_pre_str=[];
    for jj=1:size(d,1)
        if mag_str(ii,d(jj,1))==mag_str(ii,d(jj,2))
            e_pre_str=[e_pre_str 1];
        else
            e_pre_str=[e_pre_str 0];
        end
    end
    E_pre_str=[E_pre_str;e_pre_str];
end

E_delta=[];
mag_pr=[];
for ii=1:size(str_sub,1)
    E_d_tmp=E_diff(str_sub(ii,:)-ones(1,size(str_sub,2)),1);
     E_sum_tmp=E_pre_str*E_d_tmp;
     [x,m]=min(E_sum_tmp);
     delta=E_sum_tmp(1,1)-min(E_sum_tmp(2:size(E_sum_tmp,1),1));
     E_delta=[E_delta;delta];
     mag_pr=[mag_pr;mag(m,1)];
end
plot(E_delta,mag_pr,'*')
    










toc
