clear

%save C60.txt C -ascii
p=load('C60.txt');
c=sum(p)/60
B=[];
for ii=1:60
    a=p(ii,:)-c;
    b=sqrt(a*a');
    B=[B;b];
end