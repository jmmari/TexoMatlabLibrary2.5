
function ret = getMaxFrameCount()
%
% function ret = getMaxFrameCount()
%
% Request estimation of the maximum capacity of 
% frames acquisition .
%
% (C) JMM, INSERM 2010.

disp(' ')
disp(' - Requesting max frame count...')

try

    ret = calllib('TexoMatlabLibrary', 'getMaxFrameCount');
    
     if ret > 0
        disp(' - Max frame count returned.');
    else
        disp('   - Call to function "getMaxFrameCount" failed.');
    end

catch
    disp('   - Call to function "getMaxFrameCount" failed.');
end


