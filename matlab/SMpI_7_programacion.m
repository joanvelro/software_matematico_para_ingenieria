%   Practica 7 Software matematico: Programacion en Matlab
%
%   Ejercicio 1: Metodo Newton Raphson
%
    clc;
    clear all;
    format long
%   Definimos la funcion que queremos estudiar

    x=0:0.001:pi/2;
    disp('La funcion diferenciable a estudiar es:')
    fun=inline('cos(x)-x')
    funp=inline('-sin(x)-1');
    
%   Buscamos de forma grafica aproximada donde puede estar el cero

    ezplot(fun,[0 pi/2])
    grid on
    
%   Indicamos tolerancia, valor inicial aproximado y numero máximo de
%   iteracciones a la funcion creada

    Tol=0.001;
    p0=0.8;
    N0=50;
    disp('Metodo de Newton Raphson')
    disp('Tolerancia:')
    Tol
    disp('punto inicial:')
    p0
    disp('Maximo iteracciones:' )
    N0
    
    
    cero=newtonraphson(fun,funp,p0,Tol,N0);
    
    disp('El cero de la funcion f alzancada con Newton-Raphson es:')
    cero
    
    
    
    disp('Mediante el método de la biseccion el cero obtenido es:')
    disp('0.73909')
    disp('Mediante el comando fzero de Matlab el cero obtenido es')
    fzero(fun,p0)
    
%   Ejercicio 2: Formula del trapecio compuesta
    
    clear all
    clc;
    
    x=0:0.01:pi/2;
    f2=inline('exp(x).*(cos(x)).^2')
    
    a=x(1)
    b=x(length(x))
    h=0.01
    f2e=feval(f2,x);
    solucion=(h/2)*(2*sum((f2e(2:length(x)-1)))+f2e(1)+f2e(length(x)))

    %integral=trapecomp(f2,a,b,h)
    
    
    
    
%%
x=0:0.01:pi/2;
f=inline('cos(x)-x');

a=0;
b=pi/2;
c=(a+b)/2;

epsilon=0.00000001;

while abs(f(c))>epsilon
    if f(a)*f(c)<0 % miramos si hay cambio de signo por la parte derecha del intervalo
        b=c;
        c=(a+b)/2;
    else if f(c)*f(b)<0% miramos si hay cambio de signo por la izquierda del intervalo
            a=c;
            c=(a+b)/2;
        end
    end
end

fprintf('El cero se encuentra en el punto :')
cerofuncion=c


