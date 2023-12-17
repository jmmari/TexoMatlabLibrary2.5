
function ret = getProbeCenterFreq()
%
% function ret = getProbeCenterFreq()
%
% Returns centre frequency of the probe on the
% activated connector.
%
% (C) JMM, INSERM 2010.

disp(' ')
disp(' - Requesting active probe centre frequency...')

try

    ret = calllib('TexoMatlabLibrary', 'getProbeCenterFreq');
    
    if ret > 0
        disp(' - Centre frequency returned.');
    else
        disp('   - Call to function "getProbeCenterFreq" failed.');
    end

catch
    disp('   - Call to function "getProbeCenterFreq" failed.');
end


