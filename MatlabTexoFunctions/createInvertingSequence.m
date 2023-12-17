
function ret = createInvertingSequence(pulseShape)
% 
% function ret = createInvertingSequence(pulseShape)
% function ret = createInvertingSequence()
% 
% Create an imaging sequence in the Texo engine with an inverting pulse
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Creating an inverting sequence...');

try

    if (nargin < 1)
        ret = calllib('TexoMatlabLibrary', 'createInvertingSequence');
    else
        ret = calllib('TexoMatlabLibrary', 'createInvertingSequenceWithShape', pulseShape);
    end

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence created successfully.')
    end

catch
    disp('   - Call to library function "createInvertingSequence" failed.');
end


