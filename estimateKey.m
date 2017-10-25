function [ mode, key ] = estimateKey( musicfilename )
% estimateKey:
%   Uses logistic reg. and softmax estimation to predict mode and key of song.
%   Returns estimated mode and key of song.

    % extract features
    X = extractChromaFeatures(musicfilename);
    
    % determine first classification
    load('weights/major_minor_combined_softmax_coefficients.mat');
    firstProbs = mnrval(B, X', 'model', 'nominal');
    [~,firstEstimate] = max(firstProbs);
    
    minorKeyEstimate = mod(firstEstimate-1 - 3, 12) + 1;
    majorKeyEstimate = firstEstimate;
    
    switch firstEstimate
        case 1
            load('weights/min_maj/A_min_C_maj_softmax_coefficients.mat');
        case 2
            load('weights/min_maj/Bb_min_Db_maj_softmax_coefficients.mat');
        case 3
            load('weights/min_maj/B_min_D_maj_softmax_coefficients.mat');
        case 4
            load('weights/min_maj/C_min_Eb_maj_softmax_coefficients.mat');
        case 5
            load('weights/min_maj/Db_min_E_maj_softmax_coefficients.mat');
        case 6
            load('weights/min_maj/D_min_F_maj_softmax_coefficients.mat');
        case 7
            load('weights/min_maj/Eb_min_Fsharp_maj_softmax_coefficients.mat');
        case 8
            load('weights/min_maj/E_min_G_maj_softmax_coefficients.mat');
        case 9
            load('weights/min_maj/F_min_Ab_maj_softmax_coefficients.mat');
        case 10
            load('weights/min_maj/Fsharp_min_A_maj_softmax_coefficients.mat');
        case 11
            load('weights/min_maj/G_min_Bb_maj_softmax_coefficients.mat');
        case 12
            load('weights/min_maj/Ab_min_B_maj_softmax_coefficients.mat');
    end
            
    secondProbs = mnrval(B, X', 'model', 'nominal');
    [~,secondEstimate] = max(secondProbs);
    
    modeEstimate = secondEstimate;
    
    switch modeEstimate
        case 1
            keyEstimate = minorKeyEstimate;
        case 2
            keyEstimate = majorKeyEstimate;
    end
    
    % parse results
    mode = parseMode(modeEstimate);
    key = parseKey(keyEstimate);
      
end

