function f = fSSR(a,xm,ym)
    yp = a(1) * xm .* exp(a(2) * xm);
    f = sum((ym - yp) .^ 2); 
end