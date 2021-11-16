%   PRACTICA 4 SOFTWARE MATEMÁTICO 
%   JOSÉ ÁNGEL VELASCO RODRIGUEZ

%   LA EVOLUCIÓN DE DOS ESPECEIS X E Y

%   Definimos el sistema de ecuaciones diferenciales y lo resolvemos para 
%   cuando se alcance el equilibrio, obteniendo las soluciones de
%   equilibrio.
%   a,b,c,d,e y f son constantes positivas

clc;
clear all;
syms x y ;
syms a b c d e f positive
[xsol,ysol]=solve('x*(a-b*x-c*y)=0','y*(d-e*x-f*y)=0','x','y');
disp('Modelo de dos especies x e y que compiten en un medio');
disp('1º Calculamos los puntos de equilibrio:');
xsol
ysol
disp('Existen 4 puntos de quilibrio');
disp('Como a,b,c,d,e y f son constantes positivas y  sabiendo que se cumple ')
disp('las desigualdades: a/c > a/b y que a/b < d/e determinamos que los cuatro ')
disp('puntos obtenidos son positivos (están en el 1º cuadrante del plano');
disp('Operando obtenemos que : a*f > c*d ; a*e < b*d ; c*e < b*f; c/f < b/e')

%   Calculamos el jacobiano del sistema de ecuaciones diferencial

disp('2º Linealizamos el sistema: Calculamos la matriz jacobiana ');
J=jacobian([x*(a-b*x-c*y);y*(d-e*x-f*y)],[x;y])

%   Substituimos cada punto de equilibrio en la matriz jacobiana

disp('3º Substituimos la matriz Jacobiana en cada punto de equilibrio')
disp('Matriz Jacobiana evaluada en el punto 1')
J1=subs(J,[x,y],[xsol(1),ysol(1)])
disp('Matriz Jacobiana evaluada en el punto 2')
J2=subs(J,[x,y],[xsol(2),ysol(2)])
disp('Matriz Jacobiana evaluada en el punto 3')
J3=subs(J,[x,y],[xsol(3),ysol(3)])
disp('Matriz Jacobiana evaluada en el punto 4')
J4=subs(J,[x,y],[xsol(4),ysol(4)])

%   Calculamos los autovalores

disp('4º Calculamos autovalores y autovectores');
disp('autovalores 1º punto')
[V1,D1]=eig(J1);D1
disp('Es un nodo inestable pues tiene ambos autovalores positivos')
disp('autovalores 2º punto')
[V2,D2]=eig(J2);D2
disp('Es un punto de silla y por tanto inestable pues tiene un autovalor positivo y otro negativo')
disp('autovalores 3º punto')
[V3,D3]=eig(J3);D3
disp('Es un punto de silla y por tanto inestable pues tiene un autovalor positivo y otro negativo')
disp('autovalores 4º punto')
[V4,D4]=eig(J4);D4
disp('Para este punto es necesario comprobar la traza y el determinante del jacobiano')

% calculo de traza y determinantes

disp('Traza 1º punto')
T1=trace(J1);
DE1=det(J1);
pretty(simple(T1))
disp('determinante 1º punto')
pretty(simple(DE1))
disp('Traza 2º punto')
T2=trace(J2);
DE2=det(J2);
pretty(simple(T2))
disp('Determinante 2º punto')
pretty(simple(DE2))
disp('Traza 3º punto')
T3=trace(J3);
DE3=det(J3);
pretty(simple(T3))
disp('Determinante 3º punto')
pretty(simple(DE3))
disp('Traza 4º punto')
T4=trace(J4);
DE4=det(J4);
pretty(simple(T4))
disp('Determinante 4º punto')
pretty(simple(DE4))
disp('vemos que el determinante es negativo')
disp('Comprobamos si el autovalor del 4º punto es real o complejo')
pretty(T4^2-4*DE4)
disp('dependiendo de si el autovalor es real o imagninario y a si vez si este')
disp('es positivo o negativo tendremos un nodo estable, inestable o un punto de silla')

