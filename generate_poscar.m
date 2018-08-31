clear
P=load('C60.txt');

 str=load('C60_str.txt');
 Lat=[20 0 0
     0 20 0
     0 0 20];
      
      
 N_H=[] ;    
 for ii=1:size(str,1)
     p=P;
     s=str(ii,:);
     s(s==0)=[];
     ads=P(s,:);
     pos=[P;ads+(ads-repmat( [10 10 10] , size(ads,1) , 1 ))/3.3]/Lat;
     
     d=[60 size(ads,1)];
     n=['POSCAR_C60Hn/POSCAR-',num2str(ii)];
     fid=fopen(n,'w+');
     fprintf(fid,'C60Hn \n');
     fprintf(fid,'%g\n',1);
     fprintf(fid,'%-4.6f    %-4.6f    %-4.6f\n',Lat');
     fprintf(fid,'C H\n');
     fprintf(fid,'%g           %g\n',d');
     fprintf(fid,'Direct\n');
     for vv=1:size(pos,1)
         fprintf(fid,'%-4.6f     %-4.6f     %-4.6f      \n',pos(vv,:)');
     end
     fclose(fid);
     
     N_H=[N_H;size(ads,1)];
 end
% save ./inf_ya/N_Si.txt N_Si -ascii
          
 
      