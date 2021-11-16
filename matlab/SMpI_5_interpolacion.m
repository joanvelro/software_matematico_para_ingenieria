%   PRÁCTICA 5 SOFTWARE MATEMÁTICO PARA INGENIERIA
%   INTERPOLACION,CEROS,RAICES Y EXTREMOS
%
%   EJERCICIO 1: INTERPOLACIÓN
%
%   INTRODUCIMOS LOS DATOS
    clc;
    clear all;
    x=[-1.00901 -0.50203 0.12094 0.250996 0.503111 0.609399];
    y=[4.112432 5.234943 3.239498 1.309430 0.490920 0.100156];
    figure
    plot(x,y,'ok','LineWidth',2)
    ylabel('f(x)')
    xlabel('x')
%   REALIZAMOS LA INTERPOLACION DE DATOS
    xi=-1:0.001:0.609;
    inter_pchip=interp1(x,y,xi,'pchip');
    inter_cubic=interp1(x,y,xi,'cubic');%Es la misma interpolación que pchip, se sobreponen en la representación
    inter_spline=interp1(x,y,xi,'spline');
    hold on;
    plot(xi,inter_pchip,'r--','LineWidth',3);
    plot(xi,inter_cubic,'b','LineWidth',2);
    plot(xi,inter_spline,'m','LineWidth',2);
    legend('datos','interpolación pchip','interpolacion cubic','interpolacion spline');
    title('Interpolación de datos');
    disp('------------')
    disp('   EJERCICIO 1:')
    disp(' - OBSERVAMOS QUE SE PRODUCE UNA MAYOR SOBREOSCILACIÓN EN ');
    disp('   LA INTERPOLACION CON EL MÉTODO SPLINE');
    disp(' - EN LA REPRESENTACIÓN LA INTERPOLACIÓN PCHIP Y CUBIC SE SOBREPONEN, SON IGUALES')
    
    
%%   EJERCICIO 2:LOCALIZACION DE RAICES
%   DEFINIMOS LA FUNCION A ESTUDIAR COMO UNA FUNCION TIPO HANDLES
    x=0.001:0.001:2
    g=@(x) x.^2+log(x)
    g_inv=@(x) -x.^2-log(x)
%   LOCALIZAMOS LA RAIZ DE LA FUNCION GRÁFICAMENTE
    figure(2)
    ezplot(g,x)
    grid on
    disp('-----------------')
    disp('   EJERCICIO 2:')
    disp(' - OBSERVAMOS QUE LA RAIZ DEBE ESTAR ENTORNO AL X=0.6')
%   DETERMINAMOS LA RAIZ UTILIZANDO FZERO UTILIANDO UN PUNTO COMO DATO DE
%   ENTRADA
    raiz_punto=fzero(g,0.6)
    disp(' - LA RAIZ DE g(x) ESTÁ EN 0.65292')
%   DETERMINAMOS LA RAIZ EMPLEANDO UN INTERVALO COMO DATO DE ENTRADA
    raiz_inter=fzero(g,[0.4 0.8])
    disp(' - LA RAIZ OBTENIDA MEIDANTE LA ENTRADA DE UN INTERVALO ES IGUAL 0.65292')
%   LOCALIZAMOS LOS EXTREMOS DE g(x)
 
    disp(' - GRÁFICAMENTE OBSERVAMOS QUE AL TRATARSE DE UNA FUNCION MONÓTONAMENTE CRECIENTE EN TODO SU DOMINIO NO TIENE EXTREMOS');
    
    
%%   EJERCICIO 3
%   LOCALIZACION DE EXTREMOS
%   DEFINIMOS LA FUNCIÓN TIPO HANDLES MEDIANTE EL COMANDO INLINE
    xf=-1:0.1:2;
    f=inline('(x.^2)/(2+(x.^3))');
    f_inv=inline('-(x.^2)/(2+(x.^3))');
%   BUSCAMOS LOS EXTREMOS EN EL INTERVALO [-1,2]
    disp('-------------')
    disp('   EJERCICIO 3:')
    disp(' - EL MÍNIMO DE f(x) EN EL INTERVALO [-1,2] ES ')
    xmin=fminbnd(f,-1,2)
    disp(' - EL MÁXIMO DE f(x) EN EL INTERVALO [-1,2] ES :')
    xmax=fminbnd(f_inv,-1,2)
    figure(3);
    ezplot(f,[-1 2])
    grid on
    disp('GRAFICAMENTE OBSERVAMOS QUE TIENE UN MAXIMO ENTORNO AL 1.5 Y UN MÍNIMO ENTORNO A 0 ')
    
    
    %%
    
    clc;
clear all;
close all
%INTERPOLACION
t=1900:10:1990;
p= [75.995  91.972  105.711  123.203  131.669...
     150.697  179.323  203.212  226.505  249.633];
x=[1900:1:2020]; 

inter_spline=interp1(t,p,x,'spline');
inter_lineal=interp1(t,p,x,'linear');
inter_pchip=interp1(t,p,x,'pchip');
figure
plot(t,p,'or','LineWidth',6);
hold on;
 plot(x,inter_spline,'m','LineWidth',2);
 plot(x,inter_lineal,'k','LineWidth',2);
 plot(x,inter_pchip,'b','LineWidth',2);

xlabel('años');
    ylabel('poblacion');
legend('datos','interpolacion spline','interpolacion lineal','interpolacion pchip')
%%
%CEROS DE UNA FUNCION
clc;
clear all;
x=-100:1:100;
%Así :  f=x^3-2*exp(-x)-5   NO. Hay que definir la funcion tipo HANDLES;
%hay dos posibles definiciones de funciones handles
%1ºforma:
f1=@(x) x.^3-2*exp(-x)-5
%21forma:
f2=inline('x^3-2*exp(-x)-5')
disp('buscamos el cero entorno al punto 2');
raiz=fzero(f1,2)
disp('comprobamos la exactitud del cero encontrado');
f1(raiz)
raiz2=fzero(f1,[1 2])
f1(raiz2)
p=[1 -6 -72 -26];
roots(p)
plot(x,(x.^4)-(6*x.^2)-(72*x)-26)
grid on
axis([-10 10 -1000 1000]);
%%
%MÍNIMO DE UNA FUNCION
clc;
clear all
x=-5:10;
p=@(x) x^3-6*x.^2-72*x-26
xmin=fminbnd(p,7,10);
p_inv=@(x) -x.^3+6*x.^2+72*x+26
ezplot(p,[-5 10])
grid
hold on
ezplot(p_inv,[-5 10])
    