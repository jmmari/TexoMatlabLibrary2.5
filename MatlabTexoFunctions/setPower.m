
function ret = setPower(power, maxPositive, maxNegative)
%
% function ret = setPower(power, maxPositive, maxNegative)
%  - power is the overall power
%  - maxPositive is the maximum power allowed on a positive transmit
%  - maxNegative is the maximum power allowed on a negative transmit
%
% Sets the specified power values to the scanner
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Setting the scan power values...');

try

    ret = calllib('TexoMatlabLibrary', 'setPower', power, maxPositive, maxNegative);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Power values set.')
    end

catch
    disp('   - Call to function "setPower" failed.');
end

