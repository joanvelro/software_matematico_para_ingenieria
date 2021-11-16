%   CAPITULOS 6 Y 7 
%   SOFTWARE MATÉMATICO PARA LA INGENIERIA

%   6.RESOLUCIÓN NUMÉRICA DE INTEGRALES POR EL MÉTODO DE SIMPSON Y TRAPECIOS
%   INTEGRALES SIMPLES
%   INSTRUCCIONES: "quad","quadl","trap"
clc;
clear all;
%   LA FUNCION DEBE SER TIPO HANDLES
%   LA PODEMOS DEFINIR DE 3 FORMAS
%   1º OPCIÓN:
f1=inline('1./sqrt(1+x.^4)');
%   2º OPCIÓN:
f2=@(x) 1./sqrt(1+x.^4);
%   3º OPCION (CON M-FUNTION EN UN SCRIPT) LA LLAMAMOS "PRUEBA"
%   CÁLCULO DE LA INTEGRAL:
integral=quad(f1,0,1)
integral2=quadl(f1,0,1)
integral3=quad('prueba',0,1)

%   INTEGRALES DOBLES
%   INSTRUCIONES: "dblquad"

g=@(x,y) y.*sin(x)+x.*cos(y);

xmin=pi;
xmax=2*pi;
ymin=0;
ymax=pi;

integral4=dblquad(g,xmin,xmax,ymin,ymax)

figure(1)
subplot(2,2,1);
ezplot(g,[-2*pi,2*pi,-2*pi,2*pi]);
subplot(2,2,2);
ezsurf(g)
subplot(2,2,3);
ezcontour(g)
subplot(2,2,4)
ezmesh(g)
%%
%   7.RESOLUCIÓN NUMÉRICA DE ECUACIONES DIFERENCIALES
%   INSTRUCCIONES: "ode45","ode15s"
clc;
clear all;

[T,Y]=ode15s('vanderpol',[0 3000],[2 0]);% [0 3000] son los valores que puede tomar la variables t de entrada [0 2] son los valores iniciales de y
figure(2)
plot(T,Y(:,1))


%%  SOFTWARE MATÉMATICO PARA LA INGENIERIA  --  CAPITULOS 6 Y 7   

%%  6.1 RESOLUCIÓN NUMÉRICA DE INTEGRALES SIMPLES :  "quad","quadl","trap"
%   LA FUNCION DEBE SER TIPO HANDLES. SE PUEDE DEFINIR DE 3 FORMAS
clc;
clear all;

%% 1º OPCIÓN:
f1=inline('1./sqrt(1+x.^4)');
%%   2º OPCIÓN:
f2=@(x) 1./sqrt(1+x.^4);
%%   3º OPCION (CON M-FUNTION EN UN SCRIPT) LA LLAMAMOS "PRUEBA"   
integral=quad(f1,0,1)
integral2=quadl(f1,0,1)
integral3=quad('prueba',0,1)


%%  6.2 RESOLUCIÓN NUMÉRICA DE INTEGRALES DOBLES : "dblquad"
g=@(x,y) y.*sin(x)+x.*cos(y);
xmin=pi;
xmax=2*pi;
ymin=0;
ymax=pi;

integral4=dblquad(g,xmin,xmax,ymin,ymax)

figure(1)
subplot(2,2,1);
ezplot(g,[-2*pi,2*pi,-2*pi,2*pi]);
subplot(2,2,2);
ezsurf(g)
subplot(2,2,3);
ezcontour(g)
subplot(2,2,4)
ezmesh(g)


%%  7. RESOLUCIÓN NUMÉRICA DE ECUACIONES DIFERENCIALES:  "ode45","ode15s"

clc;
clear all;

[T,Y]=ode15s('vanderpol',[0 3000],[2 0]);% [0 3000] son los valores que puede tomar la variables t de entrada [0 2] son los valores iniciales de y
figure(2)
plot(T,Y(:,1))



%%   Practica 6 integracion numerica y resolucion numerica de EDOs
%   Jose Angel Velasco

%   Ejercicio 1
clc;
clear all

fh=@(x) (x.^10)-(10*x.^8)+(33*x.^6)-(40*x.^4)+(16*x.^2);
syms x y z;
disp('Ejercicio 1')
disp('Funcion:')
fs=(x.^10)-(10*x.^8)+(33*x.^6)-(40*x.^4)+(16*x.^2)

ezplot(fh,[-2 2])
grid on
disp('Valor analitico de la integral definida de fs en [-2,2]')
format long;
int_sim=double(int(fs,x,-2,2))

disp('Valor del calculo numerico de la integral anterior con quad:');
int_num=quad(fh,-2,2)

disp('error cometido en %:')
error=((int_sim-int_num)/int_sim)*100
disp('diferecia:')
diferencia=abs(int_sim-int_num)



gh=inline('(x.^2)+(y.^2)+(z.^2)'); 
gs=x.^2+y.^2+z.^2

disp('Valor calculo numérico de la integral triple:')

int_triple_n=triplequad(gh,0,1,0,1,0,1)

intx=int(gs,x,0,1)
inty=int(intx,y,0,1)
intz=int(inty,z,0,1)

int_triple_s=intz

disp('Se obtiene el mismo resultado')


%   Ejercicio 2:El atractor de lorentz
disp('Resolucion del sistema de ecuaciones: El atractor de  Lorentz')

[T,Y]=ode45('lorentz',[0 50],[27 8 10])

figure(2);

subplot(3,1,1);
plot(T,Y(:,1));
title('X')


subplot(3,1,2);
plot(T,Y(:,2));
title('Y')


subplot(3,1,3);
plot(T,Y(:,3));
title('Z')

figure(3)
plot3(Y(:,1),Y(:,2),Y(:,3))
grid on
