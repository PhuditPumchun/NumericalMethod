clear all;
clc;

exactval = exp(0.5);

errt = 1; 
currentres = 0;
n = 0;

fprintf('Et\n');

fprintf('n     Current Term         Error (%%)\n');
fprintf('--------------------------------------\n');
while errt > 0.05
    term = (0.5^n) / factorial(n);
    
    currentres = currentres + term;
    
    errt = abs(((exactval - currentres) / exactval)) * 100;
    
    fprintf('%d     %.10f      %.10f%%\n', n, currentres, errt);
    
    n = n + 1;
end

fprintf('Final Approximation = %.10f\n', currentres);
fprintf('Exact Value = %.10f\n', exactval);
fprintf('Final Relative Error = %.10f%%\n', errt);

fprintf('--------------------------------------\n');

fprintf('Ea\n');

erra = 1; 
prevres = 0;
currentres = 0;
n = 0;

fprintf('n     Current Term         Error (%%)\n');
fprintf('--------------------------------------\n');
while erra > 0.05
    term = (0.5^n) / factorial(n); 
    prevres = currentres;         
    currentres = prevres + term;  
    
    if n == 0
        fprintf('%d     %.10f      No Ea (n=0)\n', n, currentres);
    else
        erra = abs(((currentres - prevres) / currentres)) * 100; 
        fprintf('%d     %.10f      %.10f%%\n', n, currentres, erra);
    end
    n = n + 1; 
end

fprintf('--------------------------------------\n');
fprintf('Final Approximation = %.10f\n', currentres);
fprintf('Exact Value         = %.10f\n', exactval);
fprintf('Final Relative Error = %.10f%%\n', erra);