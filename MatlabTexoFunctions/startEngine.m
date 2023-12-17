
function ret = startEngine(settingsPath, samplingFreq)
%
% function ret = startEngine(settingsPath, samplingFreq)
% function ret = startEngine(settingsPath)
% 
% Starts the electronics of the scanner
%   - settingsPath is the folder with settings data
%   - samplingFreq should be 20MHz or 40MHz
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Initialising the scanner electronics...')

try
    
    if (nargin == 1)
        disp(' - Setting sampling frequency to 20 MHz...')
        ret = calllib('TexoMatlabLibrary', 'startEngine', settingsPath, 20);%, 63);
    else
        disp([' - Setting sampling frequency to ', num2str(samplingFreq), ' MHz...'])
        ret = calllib('TexoMatlabLibrary', 'startEngine', settingsPath, samplingFreq);
    end

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Scanner electronics initialised.')
    end

catch
    disp('   - Call to function "startEngine" failed.');
end



