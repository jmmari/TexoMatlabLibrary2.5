
function ret = createMDopplerSequence(pulseShape, repeatCentre)
% 
% function ret = createMDopplerSequence(pulseShape, repeatCentre)
% 
% Create an M-mode Doppler imaging sequence in the Texo engine, where a
% standard B-mode image is taken, then the centre line is repeated many times
%   - pulseShape will be the shape of the pulse
%   - repeatCentre is the number of times the centre line will be repeated
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Creating an MDoppler sequence...');

try

    ret = calllib('TexoMatlabLibrary', 'createMDopplerSequence', pulseShape, repeatCentre);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence created successfully.')
    end

catch
    disp('   - Call to function "createMDopplerSequence" failed.');
end


