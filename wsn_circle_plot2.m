function fig=wsn_circle_plot2(population,isfitness)
renk=['b' 'r' 'g' 'c' 'm' 'k'];
count=1;
r_renk=population{1}(3);
for i=1: size(population,2)
    a=population{i};
   x=a(1);
y=a(2);
r=a(3); 
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);


if(r_renk~=r)
   count=count+1;
   r_renk=r;
end
 plot(x+xp,y+yp,renk(count));
% test_circles(x,y,r,'color','red')
% fig=fill(x+xp,y+yp,'black');
if(isfitness==0)
    axis on;
else
axis off;

end

hold on
end
hold off
