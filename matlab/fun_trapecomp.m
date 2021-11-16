function solucion = trapecomp(f2,a,b,h)

solucion=(h/2)*sum(2*f2(2:length(f2)-1)+f2(a)+f2(b))

end

