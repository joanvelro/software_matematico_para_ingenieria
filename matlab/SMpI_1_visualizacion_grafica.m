%%PRACTICA 1 SOFTWARE MATEMATICO
% JOSE ANGEL VELASCO 
%-------------------------------------------------------------------------
%   EJERCICIO 1
clear all
close all
clc

t=0:0.01:10;
y=((sin(t+1)).^2)./(t+1);
figure;
plot(t,y,'r--','LineWidth',2);
xlabel('T');
ylabel('Y');
legend('Funci�n y=(sin(t+1)^2)/(t+1)');
title('Ejercicio 1');
axis ([0 10 -0.5 1]);




%%
%%-----------------------------------------------------------------------
% EJERCICIO 2 

% limpiamos la pantalla y el workspace

clear;
clc;
%   definimos el dominio de las variables x e y con un n�mero de puntos 
%   adecuado
x=-5:0.5:5;
y=-5:0.5:5;
%   hacemos un mallado con las dos variables
[X,Y]=meshgrid(x,y);
%   calculamos la funcion de dos variables
f=((Y.^3)-1).*cos(X);
%   calculamos el gradiente de la funcion creada con 0.2 puntos de
%   espaciado en cada direccion.
[GX,GY] = gradient(f,0.2);
      
%   Abrimos una ventana de representaci�n
figure;
%   Creamos 5 subventanas de visualizacion 
%   En la primera empleamos el comando mesh

subplot(3,2,1);
mesh(X,Y,f);
colorbar;
title('Mesh')

%   En la segunda empleamos el comando surf que es parecido pero con mas
%   color.

subplot(3,2,2);
surf(X,Y,f);
title('Surf')

%   En la tercera empleamos el comando pcolor que es una vista superior de
%   la representacion en 3d coloreada, junto con una leyenda de color.

subplot(3,2,3);
pcolor(X,Y,f);colorbar;
title('Pcolor & Colorbar')

%   En la cuarta empleamos el comando surfc que es igual que surf pero
%   a�ade curvas de nivel.
subplot(3,2,4);
surfc(X,Y,f);
title('Surfc')

%   Por ultimo empleamos el comando quiver y contour para representar el
%   gradiente de la funcion.

subplot(3,2,5);
contour(f);
hold on;
quiver(GX,GY);
title('Gradient & Quiver')
hold off;

%%
%-------------------------------------------------------------------------
%   EJERCICIO 3

clear;
clc;

%   Creamos una matriz aleatoria M de tama�o 10x10
disp('Esta es la matriz M')
M=randn(10).*100

%   visualizamos la 7� columna de M
disp('Esta es la 7� columna de M')
M1=M(:,7)

%   visualizamos la 3� fila de M
disp('Esta es la 3� fila de M')
M2=M(3,:)

%   Visualizamos la submatriz 4x4 formada por las filas 2,3,4 y 5 y las
%   columnas 5,6,7 y 8.
disp('Submatriz 4x4 de M formada por filas: 2,3,4 y 5 columnas: 5,6,7 y 8 ')
M3=M(2:5,5:8)

%   Visualizamos la submatriz formada por las columnas 1,6 y 9.
disp('Submatriz 10x3 con columnas: 1,6 y 9 de M')
M4=M(:,[1 6 9])


%%
clear all
clc
x = random('norm',1,50,1,100);
y = random('norm',2,50,1,100);
z = random('norm',4,50,1,100);
scatter3(z,x,y)


