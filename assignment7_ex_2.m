% ASSIGNMENT 7: EXERCISE 2

clc; clear all; close all;

f =@(x) exp(x);

dfa =@(a) exp(a); % analytical derivative d(e^x)/dx = e^x
dfi =@(a,h) (f(a+h)-f(a-h)) ./ (2*h); % numerical approximation

hset = 10.^(0:-1:-12);
a = 0;

da = dfa(a);
di = dfi(a,hset);
err = abs(di-da);

figure(1);
loglog(hset,err,'-*'); hold on;
loglog(hset(3:5),hset(3:5).^2,'K--'); hold off;
set(legend('error','$\mathcal{O}(h^2)$','Location','SouthEast'), 'Interpreter','latex');
xlabel('$h$','Interpreter','latex');
ylabel('error','Interpreter','latex');
title('error behaviour of central difference scheme');