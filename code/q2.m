syms t % declaring the symbolic variable t
f(t)=sym('f(t)'); % making f(t) a symbolic function

f(t)=heaviside(t)-2*heaviside(t-1)+heaviside(t-2); % writing f(t) in terms of heaviside(t) because heaviside(t) is unit step function
g(t)=f(t)*f(t); % taking square of the function for energy

disp('****please wait****') % displaying text

a = -2; % setting limits so that time of computation is less
b = 4; % setting limits so that time of computation is less

n=1000; % no of intervals between the limits
h=(b-a)/n;% width of each interval
sum=0;% initializing temporary varible for adding up areas of each interval


% start of logic for implementing trapezoidal rule

for i=1:(n-1) % for loop going from 1 to n-1
    k=(a + (i.*h));
    sum = sum + eval(g(k)); % logic for Trapezoidal rule of integration
end

l=(eval(g(a))+eval(g(b)))/2; % logic for Trapezoidal rule of integration
sum = sum + l;

Energy_using_trapezoidal_rule = h*sum % printing the result found from Trapezoidal rule

disp('****please wait****') % displaying text
% end of logic for implementing trapezoidal rule


% start of logic for implementing Simpsons rule

su=0; % initializing temporary varible for adding up areas of each interval

for i=a:h:(b-h) % for loop going from lower limit to (upper limit - width of interval)
    l = eval(g(i)) + (4*eval(g(i+h/2))) + eval(g(i+h)); % logic for Simpsons rule of integration
    su = su + l;
end

Energy_using_simpsons_rule = (h/6)*su % printing the result found from Simpsons rule

% end of logic for implementing Simsons rule


Energy = (Energy_using_trapezoidal_rule+Energy_using_simpsons_rule)/2 %taking average of the results found by both the methods
