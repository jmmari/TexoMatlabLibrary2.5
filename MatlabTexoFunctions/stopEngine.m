
function ret = stopEngine()
%
% function ret = stopEngine()
%
% Stop electronics and clear the library memory
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Switching off the scanner electronics...')

try

    ret = calllib('TexoMatlabLibrary', 'stopEngine');

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Scanner electronics switched off.')
    end

catch
    disp('   - Call to function "stopEngine" failed.');
end

