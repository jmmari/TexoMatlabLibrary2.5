
function ret = getFrameSize()
%
% function ret = getFrameSize()
%
% Return size of the frame using current sequence definition.
%
% (C) JMM, INSERM 2010.

disp(' ')
disp(' - Requesting frame size...')

try

     ret = calllib('TexoMatlabLibrary', 'getFrameSize');

     if ret > 0
        disp(' - Frame size returned.');
    else
        disp('   - Call to function "getFrameSize" failed.');
    end

catch
    disp('   - Call to function "getFrameSize" failed.');
end


