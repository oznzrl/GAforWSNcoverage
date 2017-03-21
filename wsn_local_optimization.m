function new_off=wsn_local_optimization(area,new_off)
for i=1:size(new_off,1)
    
    for j=1:size(new_off{1},2)
circle=new_off{i}{j};


x=circle(1);
y=circle(2);
r=circle(3);




oran=0.5;
 for k=1:size(new_off{1},2)
       
       
     if(j~=k)
     mesafe=sqrt((new_off{i}{j}(1)-new_off{i}{k}(1))^2+(new_off{i}{j}(2)-new_off{i}{k}(2))^2);
     fark=(new_off{i}{j}(3)+new_off{i}{k}(3))-mesafe;
     
     if(fark>0)
   
         %kontrol edilen node 'x'i diðerinden büyükse
         if(new_off{i}{j}(1)>new_off{i}{k}(1))
          
            new_off{i}{j}(1)=new_off{i}{j}(1)+(fark*oran); 
            new_off{i}{k}(1)=new_off{i}{k}(1)-(fark*oran);
         else
            
             new_off{i}{j}(1)=new_off{i}{j}(1)-(fark*oran);
            new_off{i}{k}(1)=new_off{i}{k}(1)+(fark*oran);  
         end
     end    
         mesafe=sqrt((new_off{i}{j}(1)-new_off{i}{k}(1))^2+(new_off{i}{j}(2)-new_off{i}{k}(2))^2);
     fark=(new_off{i}{j}(3)+new_off{i}{k}(3))-mesafe;
     
         
     if(fark>0)
         %kontrol edilen node 'y'i diðerinden büyükse
          if(new_off{i}{j}(2)>new_off{i}{k}(2))
            new_off{i}{j}(2)=new_off{i}{j}(2)+(fark*oran); 
            new_off{i}{k}(2)=new_off{i}{k}(2)-(fark*oran);
         else
            new_off{i}{j}(2)=new_off{i}{j}(2)-fark*oran; 
            new_off{i}{k}(2)=new_off{i}{k}(2)+fark*oran;  
         end
         
     end
     
     
     
         
     end
     %x axis için normalize etmek için içeri alýyoruz
if(x-r<0)
   new_off{i}{j}(1)=x+abs((x-r))*0.5;
    %farkýn yarýsý kadar içeri alýnýr
end
if(x+r>area(1))
    new_off{i}{j}(1)=x-((x+r)-area(1))*0.5;
end

%y axis için normalize etmek için içeri alýyoruz
if(y-r<0)
    new_off{i}{j}(2)=y+abs((y-r))*0.5;
    %farkýn yarýsý kadar içeri alýnýr
end
if(y+r>area(1))
   new_off{i}{j}(2)=y-((y+r)-area(2))*0.5;
end


 end



    end
    
end