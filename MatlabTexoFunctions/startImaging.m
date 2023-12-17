
function ret = startImaging()
%
% function ret = startImaging()
%
% Begins an image on the scanner
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Beginning the image...');

try

    ret = calllib('TexoMatlabLibrary', 'startImaging');

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - The image has begun.')
    end

catch
    disp('   - Call to function "startImaging" failed.');
end
