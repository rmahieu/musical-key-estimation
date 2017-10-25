function mode_str = parseMode( mode_int )
%parseMode
%   parses integer representation of mode
%   returns text representation of mode (i.e. 'min' or 'maj')

    % make sure input is in range and valid integer
    if mode_int > 2 || mode_int < 1 || mod(mode_int,1) ~= 0
        fprintf('ERROR: Invalid integer mode value\n');
        mode_str = '';
        return
    end

    txt = {'min','maj'};
    mode_str = txt(mode_int);
    mode_str = mode_str{1};

end

