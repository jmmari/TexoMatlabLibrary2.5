
function ret = endSequence()
%
% function ret = endSequence()
%
% Ends the definition of a custom sequence
%
% (C) R Criddle, Imperial College 2009

disp(' ')
disp(' - Ending the sequence definition...');

try

    ret = calllib('TexoMatlabLibrary', 'endSequence');

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence definition has finished.')
    end

catch
    disp('   - Call to function "endSequence" failed.');
end

