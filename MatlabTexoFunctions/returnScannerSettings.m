
function ret = returnScannerSettings(allRequested)
%
% function ret = returnScannerSettings(allRequested)
%
% Gets the scan settings from the Texo library
%    - returns a complete list of settings if allRequested = true
%    - returns a partial list of settings if allRequested = false
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Finding settings from scanner...')

try

    ret = calllib('TexoMatlabLibrary', 'returnScannerSettings', allRequested);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Settings returned.')
    end
    
catch
    disp('   - Call to function "returnScannerSettings" failed.');
end
