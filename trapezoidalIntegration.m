function integral = trapezoidalIntegration(f,a,b,n)
% probably only usefull as a check
% example: trapezoidalIntegration(@(x)( exp(-(x.^2)) ),0,10,100000)
 
    format long;
    x = linspace(a,b,n); %define x-axis
    integral = trapz( x,f(x) );
 
end