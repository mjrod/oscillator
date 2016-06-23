function dy = oscillator(t,y,Z) 
%solver: sol = dde23(@oscillator,10,ones(3,1),[0,540]);
%plot(sol.x,sol.y)
t
% Model parameters 
Ca = 1;
Ci = 4;
d = 1e-3;
a = 2500;
% tu = 10;
k = 1;
k_1 = 1e-1;
b = 6e-2;
ya = 15;
yi = 24;
yh = 1e-2;
f = 3e-1;
g = 1e-2;
d0 = 88e-2;
D = 25e-1;
% D_1 = 0; % micrometer^2/sec, they use 0, 800 and 4000 in the paper 
u = 1; %in the paper they use values from 1-2
% tp = 1200; % the time used in the paper covers a wide range from 0 to >1200
ylag1 = Z;
% ylag2 = Z(:,2);
dy = zeros(4,1);


% Ht = ylag3(1);
 
P = (d+(a*((y(3)*ylag1(3)).^2)))/(1+(k_1*((y(3)*ylag1(3)).^2)));

dy(1) = Ca*(1-((d/d0)^4))*P-(ya*y(1)/(1+f*(y(1)+y(2))));% Eq. for AiiA
dy(2) = Ci*(1-((d/d0)^4))*P-(yi*y(2)/(1+f*(y(1)+y(2))));% Eq. for LuxI
dy(3) = (b*y(2)/(1+(k*y(2))))-(yh*y(1)*y(3)/(1+(g*y(1))))+D*(y(4)-y(3));
dy(4) = (-d/(1-d))*D*(y(4)-y(3))-u*y(4);

end 