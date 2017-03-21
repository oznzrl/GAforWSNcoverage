function new_off=wsn_randompoint_mutation(area,new_off,mutationrate)
%gelen her bir parent için olasýlýksal mutation iþlemi yapýlýyor

if(rand()<mutationrate)
random_gene=round( size(new_off{1,1},2)*rand());
while(random_gene==0)
random_gene=round( size(new_off{1,1},2)*rand());
end

new_off{1,1}{random_gene}(1)=rand()*area(1);
new_off{1,1}{random_gene}(2)=rand()*area(2); 

end

if(rand()<mutationrate)
   
    random_gene=round( size(new_off{2,1},2)*rand());

while(random_gene==0)
random_gene=round( size(new_off{2,1},2)*rand());
end
  
new_off{2,1}{random_gene}(1)=rand()*area(2);;
new_off{2,1}{random_gene}(2)=rand()*area(2); 

end
    
