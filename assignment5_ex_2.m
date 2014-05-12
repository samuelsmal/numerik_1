clc; clear all; close all;

% NOT WORKING

g=@cos;
ai = sin(2); % analytical integration

a=0; b=2;

s = [2;3];

hset = logspace(log10(5e-1),log10(1e-4),11);
Nset = round((b-a)./hset);
hset = (b-a)./Nset;
err= zeros(length(hset),length(s));

for j=1:length(s)
    for i=1:length(Nset)
        % Calculate each quadrature.
        ni = 0; % numerical integration
        for k=1:Nset(i)
            suba = a+(k-1)*hset(i);
            subb = suba+hset(i);

            [x,w] = gauss_values(s(j),suba,subb);

            ni = ni + sum(w.*g(x));;
        end        

        err(i,j) = abs(ai-ni);
    end
end

figure(1);
loglog(hset, err, '-*');
hold on;
hset2 = hset(1:3);
loglog(hset2,exp(-10)*hset2.^4, 'k--', ... % The factor exp(-1) and exp(-6) has no
       hset2,exp(-17)*hset2.^6, 'k-.');    % actual mathematical intension but just
                                        % make the order reference line closer to
                                        % the error plots.
hold off;
xlabel('$h$','Interpreter','latex');
ylabel('error');
title('error behaviour of the numerical integration of $\int_0^2\cos(t)\,dt$','Interpreter','latex');
lgd = legend('$s=2$','$s=3$','$\mathcal{O}(h^4)$','$\mathcal{O}(h^6)$','Location','SouthEast');
set(lgd,'Interpreter','latex');