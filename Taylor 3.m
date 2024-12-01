clear all
clc

usererror = input('Enter the error percentage at which to stop: ');

fprintf('Et\n');

n = 0;            
prevres = 0;        
currentres = 0;      
exactval = (1 + 0.1)^0.5; 
errt = 1;          
firsthalf = 1;       

fprintf('n     Current Term         Error (%%)\n');
fprintf('--------------------------------------\n');

while errt > usererror
    if n > 0
        firsthalf = (firsthalf * (0.5 - (n - 1)) )/ factorial(n); 
    end
    
    term = firsthalf * 0.1^n;
    
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

n = 0;            
prevres = 0;        
currentres = 0;      
exactval = (1 + 0.1)^0.5; 
erra = 1;          
firsthalf = 1;

fprintf('n     Current Term         Error (%%)\n');
fprintf('--------------------------------------\n');

while erra > usererror
    if n > 0
        firsthalf = (firsthalf * (0.5 - (n - 1)) )/ factorial(n); 
    end
    
    term = firsthalf * 0.1^n;
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
