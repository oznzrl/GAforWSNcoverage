function new_off=wsn_uniform_point_crossover(population,s1,s2,n)

parent=round(rand()*sum(n));
new_off=cell(2,n);

for i=1:n
    if(i<parent)
        new_off{1,i}=[population{s1,1}{i}];
        new_off{2,i}=[population{s2,1}{i}];
    else
        new_off{1,i}=[population{s2,1}{i}];
        new_off{2,i}=[population{s1,1}{i}]; 
    end
% parent=mod(round(rand()*10000),2);
end

c=cell(2);
c(1,1)={new_off(1,1:end)};
c(2,1)={new_off(2,1:end)};
new_off=c;