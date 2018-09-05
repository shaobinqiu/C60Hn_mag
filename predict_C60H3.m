clear
sub_str=load('C60_H3_sub.txt');
str=load( 'C60_str.txt');
table=load('C60_table.txt');
E_ud0=load('energy_ud0');%2-24
E_ud2=load('energy_ud2');%2-24

% E_ud0=load('energy_UD');%2-24
% E_ud2=load('energy_2sUD2');%2-24

E_2s5M_1=load('energy_2s5M_1');
E_2s5M_81=load('energy_2s5M_81');
E_2s5M_161=load('energy_2s5M_161');
E_2s5M_241=load('energy_2s5M_241');
E_2s5M=[E_2s5M_1;E_2s5M_81;E_2s5M_161;E_2s5M_241];

E_C60H3_NUD1_ac=load('energy_C60H3_NUD1_ac');
E_C60H3_NUD3_ac=load('energy_C60H3_NUD3_ac');
delta_E_H3=E_C60H3_NUD3_ac(:,4)-E_C60H3_NUD1_ac(:,4);
mag_H3=2*ones(size(delta_E_H3,1),1)-sign(delta_E_H3);

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

%%%%%degenery of C60H2
size(nchoosek(1:60,3),1)
de_H3=[];
for ii=25:327
    t=table(:,str(ii,1:3));
    for jj=1:size(t,1)
        t(jj,:)=sort(t(jj,:));
    end
    t=unique(t,'rows');
    de_H3=[de_H3;size(t,1)];
end
sum(de_H3)
mag_H3=(ones(size(delta_E_H3,1),1)-sign(delta_E_H3))*0.5;
a=de_H3'*mag_H3;

figure(1)
plot(E_diff,E_2s5M(2:24,5),'*')
hold on 
plot([0,0],[0,3.5],'-r')

figure(2)
plot(E_pre,mag_H3,'*')
hold on 
plot([0,0],[0,3.5],'-r')

figure(3)
plot(E_pre,delta_E_H3,'*')
hold on 
plot([0,0],[-1,3.5],'-r')
hold on 
plot([-1,3],[0,0],'-r')
hold on 
plot([-1,3],[-1,3],'-g')


