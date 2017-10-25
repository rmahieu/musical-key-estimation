function chroma_feature = extractChromaFeatures( musicfilepath )
%extractChromaFeatures
%   returns average chroma vector for input song using
%   MATLAB chroma toolbox
    
    % read audio
    [f_audio,sideinfo] = wav_to_audio('','',musicfilepath);

    % estimate tuning
    shiftFB = estimateTuning(f_audio);

    % get pitch features
    paramPitch.winLenSTMSP = 15000;
    paramPitch.shiftFB = shiftFB;
    paramPitch.visualize = 0;
    [f_pitch,sideinfo] = audio_to_pitch_via_FB(f_audio,paramPitch,sideinfo);

    % get CP features
    paramCP.applyLogCompr = 0;
    paramCP.visualize = 0;
    paramCP.inputFeatureRate = sideinfo.pitch.featureRate;
    [f_CP,~] = pitch_to_chroma(f_pitch,paramCP,sideinfo);

    % average to get result
    chroma_feature = mean(f_CP,2);

    % paramCLP.applyLogCompr = 1;
    % paramCLP.factorLogCompr = 100;
    % paramCLP.visualize = 0;
    % paramCLP.inputFeatureRate = sideinfo.pitch.featureRate;
    % [f_CLP,sideinfo] = pitch_to_chroma(f_pitch,paramCLP,sideinfo);
    % 
    % chroma_feature = mean(f_CLP,2);

end

