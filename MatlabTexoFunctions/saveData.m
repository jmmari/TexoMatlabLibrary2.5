
function ret = saveData(saveFile, maxFrameNumber)
%
% function ret = saveData(saveFile, maxFrameNumber)
%
% Saves the scan settings and then saved frames to a file
%    - saveFile is the path of the file where data should be saved
%    - maxFrameNumber is the maximum number of frames which can be saved
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Saving the data to file...');

try

    ret = calllib('TexoMatlabLibrary', 'saveData', saveFile, maxFrameNumber);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Data has been saved to file.')
    end

catch
    disp('   - Call to function "saveData" failed.');
end

