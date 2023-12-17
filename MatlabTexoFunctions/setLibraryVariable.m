
function setLibraryVariable(varName, value)
% 
% function setLibraryVariable(varName, value)
% 
% Updates variables in the Texo library
%   - varName is the name of the variable to be updated. Allowed variables:
%      - frequency          sets tx.frequency
%      - focus              sets tx.focusDistance
%      - depth              sets rx.acquisitionDepth
%      - angle              sets tx.angle
%      - centerElement      sets tx.centerElement and rx.centerElement
%      - txCenterElement    sets tx.centerElement
%      - rxCenterElement    sets rx.centerElement
%      - pulseShape         sets tx.pulseShape
%   - value is the value that the variable will be changed to
%
% (C) R Criddle, Imperial College 2009

try
    disp(' ')
    if strcmp(varName, 'pulseShape')
        disp([' - Setting variable "', varName, '" to "', value, '".'])
    else
        disp([' - Setting variable "', varName, '" to ', num2str(value), '.'])
    end

    switch varName      % Checks which variable is being updated

        case 'frequency'
            ret = calllib('TexoMatlabLibrary', 'setFrequency', value);

        case 'focus'
            ret = calllib('TexoMatlabLibrary', 'setFocusDistance', value);

        case 'depth'
            ret = calllib('TexoMatlabLibrary', 'setAcquisitionDepth', value);

        case 'angle'
            ret = calllib('TexoMatlabLibrary', 'setAngle', value);

        case 'txAngle'
            ret = calllib('TexoMatlabLibrary', 'setTxAngle', value);

        case 'rxAngle'
            ret = calllib('TexoMatlabLibrary', 'setRxAngle', value);

        case 'centerElement'
            ret = calllib('TexoMatlabLibrary', 'setCenterElement', value);

        case 'txCenterElement'
            ret = calllib('TexoMatlabLibrary', 'setTxCenterElement', value);

        case 'rxCenterElement'
            ret = calllib('TexoMatlabLibrary', 'setRxCenterElement', value);

        case 'pulseShape'
            ret = calllib('TexoMatlabLibrary', 'setPulseShape', value);

        otherwise
            disp(['   - Error: ', varName, ' is not a library variable which can be set.'])
            return
    end

    if ret == 0
        disp([' - ', varName, ' was set.'])
    else
        disp(['   - Unexplained error when trying to update ', varName])
    end

catch
    disp('   - Call to function "setVariable" failed.');
end


