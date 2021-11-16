function I = simpson(funcion,x)

%   Calcula la integral de la funcion f(x) empleando el metodo de Simpson
%
%   Variables de entrada:
%       fun : nombre funcion
%       x   : Malla sobre la que se realiza el calculo
%
%   Variables de salida:
%       I   : Valor de la integral

M=length(x)
h=x(2)-x(1)
f=feval(funcion,x);
I=(h/3)*(2*sum(f(2:2:length(f)-1))+2*sum(f)-f(1)-f(M));

end

