
function ret = takeScan(duration)
%
% function ret = takeScan(duration)
% function ret = takeScan()
%
% Takes a scan for the specified duration or, if no duration is specified,
% for the default which is preset in the library
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Taking scan...')

try

    if (nargin==0)  % If no duration has been specified as an argument
        ret = calllib('TexoMatlabLibrary', 'takeScan');
    else            % If duration has been specified
        ret = calllib('TexoMatlabLibrary', 'takeScanForDuration', duration);
    end

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Scan successful.')
    end

catch
    disp('   - Call to function "takeScan" failed.');
end


