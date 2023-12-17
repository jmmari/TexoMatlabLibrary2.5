
function ret = createAlternatingSequence(pulseShapeA, pulseShapeB)
% 
% function ret = createAlternattingSequence(pulseShapeA, pulseShapeB)
% function ret = createAlternatingSequence()
% 
% Create an imaging sequence in the Texo engine with two alternating pulses
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Creating an alternating sequence...');

try

    if (nargin < 2)
        ret = calllib('TexoMatlabLibrary', 'createAlternatingSequence');
    else
        ret = calllib('TexoMatlabLibrary', 'createAlternatingSequenceWithShape', pulseShapeA, pulseShapeB);
    end

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence created successfully.')
    end

catch
    disp('   - Call to library function "createAlternatingSequence" failed.');
end


