
function ret = createDopplerSequence(pulseShape, lineNumber, repeat)
% 
% function ret = createDopplerSequence(pulseShape, lineNumber, repeat)
% 
% Create a Doppler imaging sequence in the Texo engine
%   - pulseShape will be the shape of the pulse
%   - lineNumber is the number of lines which should be imaged
%   - repeat is the number of times each line will be repeated
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Creating a Doppler sequence...');

try

    ret = calllib('TexoMatlabLibrary', 'createDopplerSequence', pulseShape, lineNumber, repeat);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence created successfully.')
    end

catch
    disp('   - Call to function "createDopplerSequence" failed.');
end


