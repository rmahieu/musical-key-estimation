%% SETUP

chroma_toolbox_path = 'MATLAB-Chroma-Toolbox_2.0';
addpath(chroma_toolbox_path);

%% CHOOSE SONG

song = 'music/Armin van Buuren - Save My Night (Radio Edit).mp3';

%% PROCESS!

% estimate key
fprintf('Processing %s...\n',song);
[mode, key] = estimateKey(song);

% give results
fprintf('Key estimate: %s %s\n\n', key, mode); 
