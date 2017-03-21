function y=wsn_tournament_selection(population)
x1=mod(round(rand()*10000),(size(population,1)));
x1=x1+1;

x2=mod(round(rand()*10000),(size(population,1)));
x2=x2+1;
% disp(['x1: ',num2str(x1),'  x2:',num2str(x2)]);
while x1==x2
    x2=mod(round(rand()*10000),(size(population,1)));
   x2=x2+1; 
end
% disp(['x1: ',num2str(x1),'  x2:',num2str(x2),'  pop1:',num2str(population(x1,24)),' pop2: ',num2str(population(x2,24))]);

t1=population(x1,end);
t2=population(x2,end);
if (t1{1}>t2{1})
y=x1;
else
y=x2;    
end


end