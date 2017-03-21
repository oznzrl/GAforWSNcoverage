function new_off=wsn_blx_crossover(population,s1,s2,n)

new_off=cell(2,n);
for i=1:n
x=population{s1}{i};
y=population{s2}{i};

alfa=0.5;
I=abs(x(1,1:2)-y(1,1:2));
mn=min(x,y);
mx=max(x,y);
new_off{1,i}=[abs(mn(:,1:2)-alfa*I),population{s1}{i}(3)];
new_off{2,i}=[abs(mx(:,1:2)-alfa*I),population{s2}{i}(3)];

end
c=cell(2);
c(1,1)={new_off(1,1:end)};
c(2,1)={new_off(2,1:end)};
new_off=c;
