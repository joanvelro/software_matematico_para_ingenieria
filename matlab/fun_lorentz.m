function dy=lorentz(t,y)
dy=zeros(3,1);

B=8/3;   %geometria del dominio
S=10;   %numero de Prandtl
R=28;     %numero de Rayleigh

dy(1)= -B*y(1) + y(2)*y(3);
dy(2)= S*(y(3) - y(2));
dy(3)= -y(1)*y(2) + R*y(2) - y(3);
