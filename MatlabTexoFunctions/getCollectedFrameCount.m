
function ret = getCollectedFrameCount()
%
% function ret = getCollectedFrameCount()
%
% Request estimation of the number of frames acquired 
%
% (C) JMM, INSERM 2010.

disp(' ')
disp(' - Requesting collected frame count...')

try

    ret = calllib('TexoMatlabLibrary', 'getCollectedFrameCount');
    
     if ret >= 0
        disp(' - Collected frame count returned.');
    else
        disp('   - Call to function "getCollectedFrameCount" failed.');
    end

catch
    disp('   - Call to function "getCollectedFrameCount" failed.');
end


