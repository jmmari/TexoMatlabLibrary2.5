
function ret = createStandardSequence(pulseShape)
% 
% function ret = createStandardSequence(pulseShape)
% function ret = createStandardSequence()
% 
% Create an imaging sequence in the Texo engine for normal single pulse imaging
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Creating a standard sequence...');

try

    if (nargin < 1)
        ret = calllib('TexoMatlabLibrary', 'createStandardSequence');
    else
        ret = calllib('TexoMatlabLibrary', 'createStandardSequenceWithShape', pulseShape);
    end

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence created successfully.')
    end

catch
    disp('   - Call to function "createStandardSequence" failed.');
end


