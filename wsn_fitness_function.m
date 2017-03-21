function population_fitnessed = wsn_fitness_function(population)

%alan dýþýnda kalan sensor kapsamasý çýkarýlacak ÇOK ÖNEMLÝ
%ANCAK BÖYLE FITNESS DOÐRU HESAPLANIR
ceza=0;

for i=1:size(population,1)          %population 1
   
kapsama=0;
        for k=1:size(population{i},2)
        kapsama=kapsama+(pi*(population{i}{k}(3))^2);  %kesisim olmadýðýný varsayarsak
        end     
        %sensörlerin kapsadýðý "ALAN"
        
        c=1;
for j=1:(size(population{i},2)-1 )      %sensor 1
    c=c+1;
   
 for k=j+1:((size(population{i},2)-1 )-j+c)
    condition=intersect_area(population{i}{j},population{i}{k}); %kesiþim kontrolü>varsa
   
    if(condition>0)
       kapsama=kapsama-condition; %kesiþim varsa çýkarýlýr ki gerçek kapsama bulunsun
    end
    
     %x için ortadan sonra dýþarýda kalanlar için
 if(population{i}{j}(1)>50 && 100>(population{i}{j}(1)+population{i}{j}(3)))
      ceza=pi*population{i}{j}(3)-360+(abs(population{i}{j}(1)-100)/population{i}{j}(3));
 end
 
  %y için ortadan sonra dýþarýda kalanlar için
 if(population{i}{j}(2)>50 && 100>(population{i}{j}(2)+population{i}{j}(3)))
      ceza=pi*population{i}{j}(3)-360+(abs(population{i}{j}(2)-100)/population{i}{j}(3));
 end
 
  %x için ortadan önce dýþarýda kalanlar için
 if(population{i}{j}(1)<50 && 0>(population{i}{j}(1)-population{i}{j}(3)))
      ceza=pi*population{i}{j}(3)-360+(abs(population{i}{j}(1)-population{i}{j}(3))/population{i}{j}(3));
 end
  %y için ortadan önce dýþarýda kalanlar için
 if(population{i}{j}(2)<50 && 0>(population{i}{j}(2)-population{i}{j}(3)))
      ceza=pi*population{i}{j}(3)-360+(abs(population{i}{j}(2)-population{i}{j}(3))/population{i}{j}(3));
 end
 
 kapsama=kapsama-ceza;
    
    
    
 end
end

  population(i,2)={kapsama};  
end
%population=vertcat(population,popelistist);
population_fitnessed=sortrows(population,-2);






