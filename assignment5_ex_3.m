clc; clear all; close all;

g1=@sqrt;
% a1=0; b1=1;
% ai1 = 2/3; % analytical integration
a1=1; b1=2;
ff=@(t) t^1.5/1.5;
ai1 = ff(b1)-ff(a1); % analytical integration

g2=@(t) sin(2*t);
a2=0; b2=2;
ai2 = (-cos(2*b2)/2)-(-cos(2*a2)/2);

hset = logspace(log10(5e-1),log10(1e-4),11);
Nset = round((b1-a1)./hset);
hset = (b1-a1)./Nset;
err= zeros(length(hset),2);

for i=1:length(hset)
% Calculate each quadrature.

    ni1 = 0; % numerical integration

    x = a1:hset(i):b1;
    g1x = g1(x);

    ni1 = hset(i)*sum([1/2*g1x([1 end]),  g1x(2:end-1)]);
    err(i,1) = abs(ai1-ni1);

    %-------------------------%

    ni2 = 0;

    x = a2:hset(i):b2;
    g2x = g2(x);

    ni2 = hset(i)*sum([1/2*g2x([1 end]),  g2x(2:end-1)]);
    err(i,2) = abs(ai2-ni2);
end

figure(1);
loglog(hset, err, '-*');
hold on;
hset2 = hset;
loglog(hset2,exp(-1)*hset2.^1.5, 'k--', ... % The factor exp(-1) and exp(-6) has no
       hset2,exp(-2)*hset2.^2, 'k-.');    % actual mathematical intension but just
                                        % make the order reference line closer to
                                        % the error plots.
hold off;
xlabel('$h$','Interpreter','latex');
ylabel('error');
title('error behaviour of the numerical integration using trapezoidal rule');
lgd = legend('$\int^1_0\sqrt{t}\,dt$','$\int^2_0\sin(2t)\,dt$','$\mathcal{O}(h^{1.5})$','$\mathcal{O}(h^2)$','Location','SouthEast');
set(lgd,'Interpreter','latex');