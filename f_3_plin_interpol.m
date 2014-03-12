function[sval] = f_3_plin_interpol(data_x, data_y, x_0)
    if (length(data_x) ~= length(data_y))
        error('Data vectors must have same length.');
    end
    
    if (length(data_x) <= 1)
        error('Data vectors must have at minimum length 2, to enable interpolation.');
    end

    sval = zeros(length(x_0),1);

    for index_x = 1:length(x_0)
        current_x_0 = x_0(index_x);
        
        % Finde the right index
        for k = 1:(length(data_x) - 1)
            if ((data_x(k) <= current_x_0) && (data_x(k+1) > current_x_0))
                break
            end
        end
        
        % Do interpolation
        t = (current_x_0 - data_x(k)) / (data_x(k + 1) - data_x(k));
        sval(index_x) = (1 - t) * data_y(k) + t * data_y(k + 1);
    end
end