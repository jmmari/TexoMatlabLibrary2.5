
function ret = loadConfigData(path)
%
% function ret = loadConfigData(path)
%
% Loads the scan config data from the file at path
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Loading the scan parameters...');

try

    ret = calllib('TexoMatlabLibrary', 'loadConfigData', path);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Scan parameters have been loaded.')
    end

catch
    disp('   - Call to function "loadConfigData" failed.');
end

