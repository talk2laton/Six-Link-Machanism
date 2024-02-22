function x = ressolve(A,b, x0)
x = x0;
if all(x==0)
    x = b./sum(A,2);
end
f=@(x)A*x-b;
r = A*x-b;
while(norm(r)>1e-6)
    if(norm(f(x-0.5*r))>norm(f(x+0.5*r)))
        x = x + 0.5*r;
    else
        x = x - 0.5*r;
    end
    r = A*x-b;
end