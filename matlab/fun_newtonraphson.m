function sol = newtonraphson(fun,funp,p0,Tol,N0)

i=1;



while i<=N0
    
    p=p0-(fun(p0)/funp(p0));
    
    if abs(p-p0)<Tol
        disp('Procedimiento terminado satisfactoriamente');
        sol=p
        break;
        
    else 
        i=i+1;
        p0=p;
        disp('Seguimos buscando')
    end
end

if abs(p-p0)>Tol
    disp('Solucion no alcanzada satisfactoriamente')
    sol=p
end
