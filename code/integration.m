function [integration_answer] = myint(t) %function defined by us to integrate an input function from a to b
syms t % declaring the symbolic variable t

x = input('Enter the symbolic function of t '); % asking the user to input the function in terms of t
f(t) = sym('f(t)'); % making f(t) a symbolic function
f(t)=x; % assigning the input function to f(t) 

a = input('Enter the lower limit '); % user to input the lower limit
b = input('Enter the upper limit '); % user to input the upper limit

disp('****please wait****') % displaying text

n=1000; % no of intervals between the limits
h=(b-a)/n; % width of each interval
sum=0; % initializing temporary varible for adding up areas of each interval 


% start of logic for implementing trapezoidal rule

for i=1:(n-1) % for loop going from 1 to n-1
    k=(a + (i.*h)); 
    sum = sum + eval(f(k)); % logic for Trapezoidal rule of integration
end

l=(eval(f(a))+eval(f(b)))/2; % logic for Trapezoidal rule of integration
sum = sum + l; 
Integration_using_trapezoidal_rule = h*sum  % printing the result found from Trapezoidal rule

disp('****please wait****') % displaying text

% end of logic for implementing trapezoidal rule


% start of logic for implementing Simpsons rule

su=0; % initializing temporary varible for adding up areas of each interval

for i=a:h:(b-h) % for loop going from lower limit to (upper limit - width of interval)
    l = eval(f(i)) + (4*eval(f(i+h/2))) + eval(f(i+h)); % logic for Simpsons rule of integration
    su = su + l;
end

Integration_using_simpsons_rule = (h/6)*su % printing the result found from Simpsons rule

% end of logic for implementing Simsons rule


integration_answer = (Integration_using_trapezoidal_rule+Integration_using_simpsons_rule)/2 %taking average of the results found by both the methods
end
