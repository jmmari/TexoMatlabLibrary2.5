
function ret = stopImaging()
%
% function ret = stopImaging()
%
% Stops the scan in progress
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Stopping the image...');

try

    ret = calllib('TexoMatlabLibrary', 'stopImaging');

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - The image has finished.')
    end

catch
    disp('   - Call to function "stopImaging" failed.');
end
