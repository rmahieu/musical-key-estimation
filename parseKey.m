function key_str = parseKey( key_int )
%parseKey
%   parses integer representation of key
%   returns text representation of key (i.e. 'A','B','C',...)

    % make sure input is in range and valid integer
    if key_int > 12 || key_int < 1 || mod(key_int,1) ~= 0
        fprintf('ERROR: Invalid integer key value\n');
        key_str = '';
        return
    end
    
    txt = {'C','Db','D','Eb','E','F','F#','G','Ab','A','Bb','B'};
    key_str = txt(key_int);
    key_str = key_str{1};

end

