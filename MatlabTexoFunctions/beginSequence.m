
function ret = beginSequence()
%
% function ret = beginSequence()
%
% Begins the definition of a custom sequence
%
% (C) R Criddle, Imperial College 2009

disp(' ')
disp(' - Beginning the sequence definition...');

try

    ret = calllib('TexoMatlabLibrary', 'beginSequence');

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence definition has begun.')
    end

catch
    disp('   - Call to function "beginSequence" failed.');
end

