clear
sub_str=load('C60_H3_sub.txt');
str=load( 'C60_str.txt');

E_ud0=load('energy_ud0');%2-24
E_ud2=load('energy_ud2');%2-24

% E_ud0=load('energy_UD');%2-24
% E_ud2=load('energy_2sUD2');%2-24

E_2s5M_1=load('energy_2s5M_1');
E_2s5M_81=load('energy_2s5M_81');
E_2s5M_161=load('energy_2s5M_161');
E_2s5M_241=load('energy_2s5M_241');
E_2s5M=[E_2s5M_1;E_2s5M_81;E_2s5M_161;E_2s5M_241];
D=[];
for ii=1:size(sub_str)
    tmp=[];
    for jj=1:3
        for kk=2:24
            if sub_str(ii,2*jj-1:2*jj)==str(kk,1:2)
                tmp=[tmp kk];
            end
        end
    end
        D=[D;tmp];
end
E_diff=E_ud2(:,4)-E_ud0(:,4);

n=0;
E_pre=[];
for ll=1:size(D,1)
    [x,m]=min([E_diff(D(ll,1)-1,1)+E_diff(D(ll,2)-1,1)+E_diff(D(ll,3)-1,1),E_diff(D(ll,1)-1,1),E_diff(D(ll,2)-1,1),E_diff(D(ll,3)-1,1)]);
    r=min([E_diff(D(ll,1)-1,1),E_diff(D(ll,2)-1,1),E_diff(D(ll,3)-1,1)]);
    delta=E_diff(D(ll,1)-1,1)+E_diff(D(ll,2)-1,1)+E_diff(D(ll,3)-1,1)-r;
    E_pre=[E_pre;delta];
end


figure(3)
plot(E_diff,E_2s5M(2:24,5),'*')
hold on 
plot([0,0],[0,3.5],'-r')

figure(4)
plot(E_pre,E_2s5M(25:327,5),'*')
hold on 
plot([0,0],[0,3.5],'-r')
