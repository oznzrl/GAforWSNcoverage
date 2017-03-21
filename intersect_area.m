function A = intersect_area(c1,c2)
x1=c1(:,1);
y1=c1(:,2);
r1=c1(:,3);

x2=c2(:,1);
y2=c2(:,2);
r2=c2(:,3);
%monte carlo estimation ile ayný deðeri veriyor
%http://www.benfrederickson.com/calculating-the-intersection-of-3-or-more-circles/

%=circle2;
d2 = (x2-x1)^2+(y2-y1)^2;
 d = sqrt(d2);
 t = ((r1+r2)^2-d2)*(d2-(r2-r1)^2);
 if t >= 0 % The circles overlap
   A = r1^2*acos((r1^2-r2^2+d2)/(2*d*r1)) ...
      +r2^2*acos((r2^2-r1^2+d2)/(2*d*r2)) ...
      -1/2*sqrt(t);
 elseif d > r1+r2  % The circles are disjoint
   A = 0;
 else  % One circle is contained entirely within the other
   A = pi*min(r1,r2)^2;
 end