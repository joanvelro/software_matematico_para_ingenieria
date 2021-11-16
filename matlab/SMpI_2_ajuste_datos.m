%   PRACTICA 2 SOFTWARE MATEMATICO
%   JOS� �NGEL VELASCO 

%   EJERCICIO 1

    clc;
    %clear all;
%   Introduci�n de datos 
    x=[1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01];
    y=[0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15];
    
%   ajuste de datos a un polinomio de orden 2
    coef=polyfit(x,y,2);
    ajustepol=polyval(coef,x);
    residuo=ajustepol-y;
    
%   ajuste exponencial
    X=[ones(size(x)) exp(x) exp(x).*x];
    beta=X\y;
    ajuste2=X*beta;
    residuo2=ajuste2-y;
    
%   representaci�n gr�fica
    figure(1);
    subplot(2,2,1);
    plot(x,y,'ok');
    hold on;
    plot(x,ajustepol,'r');
    xlabel('posicion x');
    ylabel('posicion y');
    legend('orbita eliptica','ajuste polinomio orden 2');
    grid on;
    title('Ajuste polinomial');
    
    subplot(2,2,3);
    plot(x,residuo,'*r');
    legend('residuos ajuste polinomio orden 2');
    grid on;
    axis([0 1.5 -0.02 0.02]); 
    title('Residuos del ajuste polinomial');
    
    subplot(2,2,2);
    plot(x,y,'ok');
    hold on;
    plot(x,ajuste2,'b');
    grid on;
    xlabel('posicion x');
    ylabel('posicion y');
    legend('orbita eliptica','ajuste exponencial');
    title('Ajuste exponencial');
    
    subplot(2,2,4);
    plot(x,residuo2,'*b');
    legend('residuos ajuste exponencial');
    grid on;
    title('Residuos del ajuste exponencial');
    axis([0 1.5 -0.02 0.02]); 
   
%%   EJERCICIO 2

%   Introducci�n de datos
    t=[1:25]';
    y=[5.0291 6.5099 5.3666 4.1272 4.2948 ...
        6.1261 12.5140 10.0502 9.1614 7.5677 ...
        7.2929 10.0357 11.0708 13.4045 12.8415 ... 
        11.9666 11.0765 11.7774 14.5701 17.0440 ... 
        17.0398 15.9069 15.4850 15.5112 17.6572]';
    
%   Ajuste de datos mediante recta
    coef3=polyfit(t,y,1);
    ajuste3=polyval(coef3,t);
    residuo3=ajuste3-y;
    
%   Ajuste de datos mediante recta corregido
    tp=[1:6 8:25]';
    yp=[5.0291 6.5099 5.3666 4.1272 4.2948 ...
        6.1261 10.0502 9.1614 7.5677 ...
        7.2929 10.0357 11.0708 13.4045 12.8415 ... 
        11.9666 11.0765 11.7774 14.5701 17.0440 ... 
        17.0398 15.9069 15.4850 15.5112 17.6572]';
    
    coef4=polyfit(tp,yp,1);
    ajuste4=polyval(coef4,tp);
    residuo4=ajuste4-yp;
    
%   Ajuste de datos senoidal corregido
    X1=[ones(size(tp)) tp sin(tp)];
    beta1=X1\yp;
    ajuste5=X1*beta1;
    residuo5=ajuste5-yp;
    
%   Representaci�n grafica
    figure(2);
    
    subplot(2,2,1);
    plot(t,y,'ok');
    hold on;
    plot(t,ajuste3,'r');
    grid on;
    title('Ajuste mediante recta');
    xlabel('Tiempo t');
    ylabel('Posicion y');
    legend('Observaciones','Ajuste de datos');
    
    subplot(2,2,3);
    plot(t,residuo3,'*r');
    title('Residuos ajuste recta');
    grid on;
    
    subplot(2,2,2);
    plot(tp,yp,'ok');
    hold on;
    plot(tp,ajuste4,'r');%ajuste recta
    plot(tp,ajuste5,'b');%ajuste senoidal
    grid on;
    xlabel('Tiempo t');
    ylabel('Posicion y');
    title('Ajuste de datos corregido');
    legend('Observacione','Ajuste mediante recta corregido','Ajuste senoidal corregido');
    
    subplot(2,2,4);
    plot(tp,residuo4,'*r');
    title('Residuos ajuste corregido');
    grid on;
    axis([0 30 -6 4]);
    hold on;
    plot(tp,residuo5,'*b');
    legend('Residuos ajuste recta','Residuos ajuste senoidal');
    
    %%
    clc
    clear all
    
    % Example
% -------
 x=-2*pi:pi/16:2*pi; 
 y1 = sin(x).*x;

 y2 = cos(x).*x;
 [X,Y]=curveintersect(x,y1,x,y2);
 figure
 plot(x,y1,'k',x,y2,'b',X,Y,'ro')
    

