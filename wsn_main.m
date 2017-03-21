clc;
clear;
t=cputime; 
%yapýlan mod iþlemleri kontrol edilmeli ki son hücreler alýnmýyor olabilir
%+1 yapýlmalý
 hFig = figure(1);
%  set(hFig, 'Position', [200 100 500 500]);
% box off;
% set(hFig,'visible','off')
% set(hFig,'visible','on')
%  set(hFig,'box','on')
% set(hFig,'box','off')
%  set(hFig,'xcolor','w','ycolor','w','xtick',[],'ytick',[])
baslikgoster=1;
color = get(hFig,'Color');
set(gca,'XColor',color,'YColor',color,'TickDir','out')
isfitness=0;
eniyi=[];
% tic



area=[100,100;200,200;400,400];
%n=[10,62,40,20,39,248,160,80,156,991,637,319];
%r=[14,6,8,12];
% n=[10,15,52,50,90,240,45,25,15];
% r=[14,14,7,7,5,5,15,20,25];
% tigtnessratio=n(:,1:5).*pi.*r(:,1:5).^2./(100*100)


% testdata=12;



%load i6_initial.mat
%load hp100.mat
%load hol170.mat
%load hept_initial23_i350.mat
%load hominitial.mat
%load hetinitial.mat
%load sonuc1000.mat
grafciz=1;
localoptcalistir=0;
popsize=50;
mutationrate=0.5;
elitist=2;
printdeger=1;
itercount=100;
area=area(1,:);



% n=[n(testdata)];
% r=[r(4)];






%n=[20];
%r=[12];

n=[6 7 10];
r=[14 11.20 8.96];

%r=[6 4.80 3.84];
%--24
% n=[6 8 10];
% r=[12 9.6 7.68];
%36
% n=[8 12 16];
% r=[10 8 6.4];
%57
% n=[12 18 27];
% r=[8 6.4 5.12];
%S5-0.9
% n=[28 41 61];
% r=[6 4.8 3.84];
%  
 


% newchildcount=popsize-elitist;
%initiliaze population

sonuc=cell(1,3);

% input('s')
%aþaðýdakiler açýlacak-------------------------------
tic;
t1=toc;
population=wsn_initial_population(n,r,popsize,area);
t2=toc;
population=wsn_fitness_function(population);
t3=toc;
%sonuc=vertcat(sonuc,horzcat(population(1,:),0));
%sonuc=sonuc(2,:);
for iter=1:itercount


% t=cputime;
%  if iter==1
    
      %calculate the fitness  >>>circle must be in the area to cover 
% t=cputime;
      









% 'initial'
% CPU=cputime-t

% t=cputime;


% 'fitness'
% CPU=cputime-t
 
%  else
      
% burada yapýlacak iþlem ile daha fazla parent seçilecek
% bunu matris iþlemi þekline dönüþtürürsek hýzdan kazanýrýz
% crossover ve mutation iþlemlerin de deðiþiklik gerektirir




elit=population(1:2,:);
%population(1:2,2)={0};
   for m=elitist+1:2:popsize-elitist %bu bize çok hýz kazandýrdý ve daha iyi sonuç verdi
%        t=cputime;
chromosome1= wsn_tournament_selection(population);
chromosome2=chromosome1;
while(chromosome1==chromosome2)
chromosome2=wsn_tournament_selection(population);
end

%elitist yaklaþým için yapýldý
% chromosome1=1;

% 'selection'
% t=cputime-t

% t=cputime;
if(rand()<=0.5)
 new_off=wsn_blx_crossover(population,chromosome1,chromosome2,sum(n));
else
%  new_off=wsn_uniform_crossover(population,chromosome1,chromosome2,sum(n));
new_off=wsn_uniform_point_crossover(population,chromosome1,chromosome2,sum(n)); 
end
% 
% 'crossover'
% t=cputime-t

% t=cputime;
 
new_off=wsn_randompoint_mutation(area,new_off,mutationrate);

%  'mutation'
% t=cputime-t
 %  new_off=wsn_normalization(area,new_off);

%----------------------------------------------------------
%  new_off=wsn_local_optimization(area,new_off);
% t=cputime; 
new_off=wsn_fitness_function(new_off);
  
%   'fitness newoff'
%   m
%   t=cputime-t
%----------------------------------------------------------



%population{m+elitist,1}=new_off{1,1};
%population{m+elitist,2}=new_off{1,2};
%population{m+elitist+1,1}=new_off{2,1};
%population{m+elitist+1,2}=new_off{2,2};


population=sortrows(vertcat(population,new_off),-2);
population=population(1:popsize,:);
   end
   population=sortrows(vertcat(population,elit),-2);
population=population(1:popsize,:);
   
   sonuc=vertcat(sonuc,horzcat(population(1,:),iter));
   t4=toc;
%----------------------------------------------------------


% population=sortrows(vertcat(population,new_off),-2);
% t=cputime;
% population=vertcat(population,new_off);

% 'vertcat elitist end'
% t=cputime-t
% input('-------------')

   
  
 

%input('prompt');

   
% BURASI KRÝTÝK BUNU TÜM POPULATION ÝÇÝN MÝ YOKSA NEW OFF ÝÇÝN MÝ YAPALIM
% YUKARUDAKÝ YADA BURADAKÝ SÝLÝNECEK

%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ekle

% t=cputime;
for i=1:10
if(localoptcalistir==1)
    populationx=wsn_local_optimization(area,population);
end
end
% 'local optimizaiton'
% t=cputime-t
% population2=wsn_normalization(area,population);
% t=cputime;
if(localoptcalistir==1)
   populationx=wsn_fitness_function(populationx);
   population=vertcat(population,populationx);
   population=sortrows(population,-2);
   population=population(1:popsize,:);
else
  population=wsn_fitness_function(population); 
   
end


% 'fitness'
% t=cputime-t
% population=sortrows(population,-2);

% size(population)
% population=population(1:50,:);
% input('--')
%end


% population=sortrows(population,-2);

% 
% off1=new_off(1,2);
% off2=new_off(2,2);
% pop=population(1,2);
 


% population=sortrows(vertcat(population,new_off),-2);
% ------------------------------------------------------------
% population=population(1:50,:); (geri alýnabilir)
% --------------------------------------------------------------
% input('prompt');
%  clc;


% t=cputime;

if(iter==1)
foundbestat=1;
e=cputime-t;
best=population{1,2};
drawgraf=1;

else
    if(population{1,2}>best)
        e=cputime-t;
        best=population{1,2};
    foundbestat=iter;
    drawgraf=1;
    
    end
end

if(mod(iter,grafciz)==0 ||iter==1)
for i=1:1
    if(mod(iter,1)==0)
  wsn_circle_plot2(population{i,1},isfitness);
    end
  axis([0 area(1) 0 area(2)]);
if(isfitness==0)
    axis on;
else
axis off;

end
if(baslikgoster==1)
title( sprintf('i=%d BestAt(Ý)=%d CPU=%f kapsama=%f',iter,foundbestat,e,population{i,2}));
end  
drawnow;
  hold off;
  refresh;
end
 %t=cputime-t
end


if(printdeger==1)
input('-------------')
end



eniyi=horzcat(eniyi,population{1,2});
end





% toc
% cputime returns the total CPU time (in seconds) used by your MATLAB® application 
% from the time it was started


%draw best solution


