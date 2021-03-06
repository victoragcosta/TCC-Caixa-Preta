classdef Position < TemplateLine
    % Calcula Posi��o integrando a Velocidade
    % Usando a Velocidade, fazemos a integral discreta (�rea do trap�zio aculmulado)
    % P/ o novo dado isso significa, ultimo valor + novo trap�zio (entre ultimo dado e o novo)
    % � considerado nesse calculo que, as amostragens est�o espa�adas de 1
    % periodo da amostragem, ent o trap�zio � igual a 1/freq * ((n-1 + n)/2)

    properties
    end

    methods
        function obj = Position(w_size)
            obj = obj@TemplateLine(...
                'Espa�o em metros', ...     % p_title
                'Amostra', ...              % p_xlabel
                'metros', ...               % p_ylabel
                {'X', 'Y', 'Z'}, ...        % s_legend
                {'r', 'g', 'b'});           % sources_color

            obj.w_size = w_size;
            obj.data = zeros(w_size, 3);
        end

        function calculate(obj, velocity, old_velocity, freq_sample)
            new_data = obj.calculate_position(obj.last(), velocity, old_velocity, freq_sample);
            obj.data = [obj.data(2:obj.w_size, :); new_data];
        end
    end
end