function population_initiliazed = wsn_initial_population(n,r,N,area)


% n=10; %sensor count  all has same radius
% r=14; %radius of sensor
% 
% N=50; %poppulation size
% area=[100 50]; %working area to cover
% n=[0 1 0];
% r=[14 500 8.96];



population_initiliazed=cell(N,2); %2 because fitness value will be added
rad=r(1);
for i=1:N
    parent=cell(1,sum(n));
    for j=1:sum(n)
        
    x=rand()*area(1);
    y=rand()*area(2);
    if(j<=n(1))
        rad=r(1);
    elseif(j<=(n(1)+n(2)))
        rad=r(2);    
    else
        rad=r(3);    
    end
    
    
    
    parent{j}=[x y rad];
   
    end
   population_initiliazed{i}=parent;
   
end
 




