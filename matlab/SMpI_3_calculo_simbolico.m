% PRACTICA 3 SOFTWARE MATEMÁTICO PARA INGENIERÍA ELÉCTRICA
% JOSE ANGEL VELASCO

% Limpiamos el workspace y la command window
clc;
clear all;

syms Eo M y q x L
disp('---------------------------');
disp('Resolvemos la ecuacion diferencial de la flexión de la viga e imponemos las condiciones iniciales');
disp('---------------------------');
y=dsolve('Eo*M*D4y=q','y(0)=0','y(L)=0','D2y(0)=0','D2y(L)=0','x');

% expresamos la ecuacion de la flexion en funcion de la longitud de la viga
% de forma mas adecuada
disp('---------------------------');
disp('Ecuación de la viga apoyada');
disp('---------------------------');
pretty(simple(y))
disp('---------------------------');
disp('comprobamos que la flexion maxima de la viga se produce en la mitad');
disp('---------------------------');
% para ello realizamos la primera derivada y substituimos por L/2, el
% resultado debe ser negativo y si realizamos la segunda derivada y
% substituimos por L/2 el resultado debe ser negativo

max=L/2;
disp('---------------------------');
disp('1º derivada evaluada en L/2');
disp('---------------------------');
subs(diff(y),x,max)
disp('---------------------------');
disp('2º derivada evaluada en L/2');
disp('---------------------------');
subs(diff(y,2),x,max)
disp('---------------------------');
disp('la primera derivada en L/2 es nula y la segunda , negativa luego efectivamente la flexión máxima se produce en L/2');
disp('---------------------------');
disp('La flexión máxima en L/2 será pues:');
ymax=subs(y,x,L/2);
pretty(ymax)

% comprobamos ahora el punto de maxima flexion si los extremos de la viga
% estan empotrados en lugar de apoyados.

y2=dsolve('Eo*M*D4y=q','y(0)=0','y(L)=0','Dy(0)=0','Dy(L)=0','x');
disp('---------------------------');
disp('Ecuacion de flexion de viga empotrada:')
disp('-------------------------------------');
pretty(simple(y2))
disp('---------------------------');
disp('Comprobamos que la flexion maxima de la viga se produce en la mitad:');
disp('---------------------------');
disp('1º derivada evaluada en L/2:');
subs(diff(y2),x,max)
disp('---------------------------');
disp('2º derivada evaluada en L/2:');
subs(diff(y2,2),x,max)
disp('---------------------------');
disp('La primera derivada en L/2 es nula y la segunda , negativa luego efectivamente la flexión máxima se produce en L/2');
disp('---------------------------');
disp('La flexión máxima en L/2 será pues:');
ymax2=subs(y2,x,L/2);
pretty(ymax2)
disp('---------------------------');
disp('La flexion maxima de la viga cuando está empotrada es 5 veces inferior a cuando está apoyada');
disp('---------------------------');


%dibujamos en un mismo grafico las flexiones obtenidas en los apartados
%anteriores

flexion_empotrada=subs(y2,[q,L,Eo,M],[2,1,1,1])
flexion_apoyada=subs(y,[q,L,Eo,M],[2,1,1,1]);

figure(1);
ezplot(flexion_empotrada,[0 1]);
hold on;
fa=ezplot(flexion_apoyada,[0 1]);
set(fa,'Color','r')
legend('Flexion viga empotrada','Flexión viga apoyada');
title('Flexion en viga')
axis([0 1 0 0.03]);
xlabel('Longitud (m)');
ylabel('Flexión');
