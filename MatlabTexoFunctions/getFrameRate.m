
function ret = getFrameRate()
%
% function ret = getFrameRate()
%
% Request frame rate estimation.
%
% (C) JMM, INSERM 2010.

disp(' ')
disp(' - Requesting frame rate...')

try

    ret = calllib('TexoMatlabLibrary', 'getFrameRate');
    
     if ret > 0
        disp(' - Frame rate returned.');
    else
        disp('   - Call to function "getFrameRate" failed.');
    end

catch
    disp('   - Call to function "getFrameRate" failed.');
end


