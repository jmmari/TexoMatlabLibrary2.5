
function errorCode(code)
% 
% function errorCode(code)
% 
% Prints the error message associated with the specified code
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009


if code == 0    % If code is 0, errorCode should not have been called, so returns
    return
end

disp(' ')
disp(' - Error when accessing the Texo library:')

if code < 0
    codePos = -code;            % Makes the error code a positive number
else
    codePos = code;
end

codeChar = num2str(codePos);    % The string is easier to work with
if length(codeChar) < 3         % Error code should have 3 digits
    disp(['   - Unknown error = ', codeChar]);
    return
end

switch codeChar(1:2)    % Checks the first two digits of the code
    
    % CODES BEGINNING WITH A 1 BELONG TO TEXOMATLABLIBRARY FUNCTIONS
    
    case '11'   % Function startEngine(char*,int)
        switch codeChar(3)
            case '0'
                disp('   - The TexoTools object could not be created by the library')
                disp('     in function "startEngine(char * settingsFileName, int freq)".')
            otherwise
                disp(['   - Unknown error = ', codeChar, '.'])
        end
    
        
    % CODES BEGINNING WITH 2 BELONG TO TEXOTOOLS FUNCTIONS

    case '21'   % Function loadConfigData(char*)
        disp('   - Error in library function "loadConfigData(char* configFilePathName)":')
        
        switch codeChar(3)
            case '1'    % Code 211
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 212
                disp('     - Failed to set power values to scanner.')
            case '3'    % Code 213
                disp('     - Failed to add TGC to scanner.')
            case '4'    % Code 214
                disp('     - Failed to activate probe connector.')
            case '5'    % Code 215
                disp('     - Failed to set power values and add TGC to scanner.')
            case '6'    % Code 216
                disp('     - Failed to set power values and activate probe connector.')
            case '7'    % Code 217
                disp('     - Failed to add TGC and activate probe connector.')
            case '8'    % Code 218
                disp('     - Failed to set power values, add TGC and activate probe connector.')
            case '9'    % Code 219
                disp('     - Unexplained error while sending configuration values to scanner.')
            case '0'    % Code 210
                disp('     - General error: configuration data could not be loaded.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '22'   % Function loadConfigData(char*)
        disp('   - Error in library function "loadConfigData(char* configFilePathName)":')
        
        switch codeChar(3)

            case '1'    % Code 221
                disp('     - The specified config file failed to open.')
            case '2'    % Code 222
                disp('     - No config file specified -- default file failed to open.')
            case '3'    % Code 223
                disp('     - Unexplained error while reading configuration file.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '23'   % Function takeScan(int)
        disp('   - Error in library function "takeScan(int duration)":')
        
        switch codeChar(3)
            case '1'    % Code 231
                disp('     - Scanner not ready -- already present or not present or not initialised.')
            case '2'    % Code 232
                disp('     - Call to Sonix function "runImage" failed.')
            case '3'    % Code 233
                disp('     - Call to Sonix function "stopImage" failed.')
            case '0'    % Code 230
                disp('     - General error: scan failed.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '24'   % Function takeScan()
        disp('   - Error in library function "takeScan()":')
        
        switch codeChar(3)
            case '1'    % Code 241
                disp('     - Scanner not ready -- already present or not present or not initialised.')
            case '2'    % Code 242
                disp('     - Call to Sonix function "runImage" failed.')
            case '3'    % Code 243
                disp('     - Call to Sonix function "stopImage" failed.')
            case '4'    % Code 244
                disp('     - The scan duration has not been preset or specified by the user.')
            case '0'    % Code 240
                disp('     - General error: scan failed.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '25'   % Function saveData(char*,int)
        disp('   - Error in library function "saveData(char * fileName, int maxNumberOfFramesToSave)":')
        
        switch codeChar(3)
            case '1'    % Code 241
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 242
                disp('     - The scanner has no frames to save.')
            case '3'    % Code 243
                disp('     - The save file will not open.')
            case '4'    % Code 244
                disp('     - The header has exceded the 1024 byte size limit.')
            case '5'    % Code 245
                disp('     - The save file will not close.')
            case '0'    % Code 240
                disp('     - General error: data was not saved.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '26'   % Function returnScannerSettings(bool)
        disp('   - Error in library function "returnScannerSettings(bool allSettingsRequested)":')
        
        switch codeChar(3)
            case '1'    % Code 251
                disp('     - The library could not open a Matlab engine')
            case '2'    % Code 252
                disp('     - The library could not put the settinsg into the Matlab environment')
            case '3'    % Code 253
                disp('     - The library could not close the Matlab engine')
            case '0'    % Code 250
                disp('     - General error: settings were not found')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end



    % CODES BEGINNING WITH 3 BELONG TO TLSONIX FUNCTIONS

    case '31'   % Function startEngine(char*,int)
        disp('   - Error in library function "startEngine(char * settingsFileName, int freq, int memSize)":')
        
        switch codeChar(3)
            case '1'    % Code 311
                disp('     - Scanner not ready -- already initialised or not present.')
            case '2'    % Code 312
                disp('     - Call to UltraSonix function "init" failed.')
            case '3'    % Code 313
                disp('     - Invalid frequnecy specified by user. 20MHz used as default.')
            case '0'    % Code 310
                disp('     - General error: the electronics of the scanner failed to initialise.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end

    case '32'    % Function setPower(int,int,int)
        disp('   - Error in library function "setPower(int power, int powerMax, int powerMin)":')
        
        switch codeChar(3)
            case '1'    % Code 321
                disp('     - Scanner not ready -- imaging or not initialised.')
            case '2'    % Code 322
                disp('     - Power values are outside required range (0-15).')
            case '3'    % Code 323
                disp('     - Call to UltraSonix function "setPower" failed.')
            case '0'    % Code 320
                disp('     - General error: the scanner has not had power values set.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
     case '33'    % Function startImaging()
        disp('   - Error in library function "startImaging()":')
        
        switch codeChar(3)
            case '1'    % Code 331
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 332
                disp('     - Call to UltraSonix function "runImage" failed.')
            case '0'    % Code 330
                disp('     - General error: the image could not begin.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
            
    case '34'    % Function stopImaging()
        disp('   - Error in library function "stopImaging()":')
        
        switch codeChar(3)
            case '1'    % Code 341
                disp('     - Scanner not ready -- not present or not imaging.')
            case '2'    % Code 342
                disp('     - Call to UltraSonix function "stopImage" failed.')
            case '0'    % Code 340
                disp('     - General error: the could not be stopped.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end

    case '35'    % Function stopEngine()
        disp('   - Error in library function "stopEngine()":')
        
        switch codeChar(3)
            case '1'    % Code 351
                disp('     - Scanner not ready -- not present or not initialised.')
            case '2'    % Code 352
                disp('     - Call to UltraSonix function "shutdown" failed.')
            case '0'    % Code 350
                disp('     - General error: the electronics of the scanner failed to shutdown.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
               
    
    % CODES BEGINNING WITH 4 BELONG TO TLSEQUENCER FUNCTIONS (STANDARD SEQUENCES)
        
    case '41'   % Function createStandardSequence()
        disp('   - Error creating standard sequence:')
        
        switch codeChar(3)
            case '1'    % Code 411
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 412
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 413
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode.')
            case '4'    % Code 414
                disp('     - Call to UltraSonix function "addLine" failed in linear mode.')
            case '5'    % Code 415
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 410
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '42'   % Function createStandardSequence(char*)
        disp('   - Error creating standard sequence:')
        
        switch codeChar(3)
            case '1'    % Code 421
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 422
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 423
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode.')
            case '4'    % Code 424
                disp('     - Call to UltraSonix function "addLine" failed in linear mode.')
            case '5'    % Code 425
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 420
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '43'   % Function createAlternatingSequence()
        disp('   - Error creating alternating sequence:')
        
        switch codeChar(3)
            case '1'    % Code 431
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 432
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 433
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, first pulse.')
            case '4'    % Code 434
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, second pulse.')
            case '5'    % Code 435
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, first pulse.')
            case '6'    % Code 436
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, second pulse.')
            case '7'    % Code 437
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 430
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '44'   % Function createAlternatingSequence(char*)
        disp('   - Error creating alternating sequence:')
        
        switch codeChar(3)
            case '1'    % Code 441
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 442
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 443
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, first pulse.')
            case '4'    % Code 444
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, second pulse.')
            case '5'    % Code 445
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, first pulse.')
            case '6'    % Code 446
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, second pulse.')
            case '7'    % Code 447
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 440
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '45'   % Function createInvertingSequence()
        disp('   - Error creating inverting sequence:')
        
        switch codeChar(3)
            case '1'    % Code 451
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 452
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 453
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, first pulse.')
            case '4'    % Code 454
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, second pulse.')
            case '5'    % Code 455
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, first pulse.')
            case '6'    % Code 456
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, second pulse.')
            case '7'    % Code 457
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 450
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '46'   % Function createInvertingSequence(char*)
        disp('   - Error creating inverting sequence:')
        
        switch codeChar(3)
            case '1'    % Code 461
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 462
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 463
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, first pulse.')
            case '4'    % Code 464
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, second pulse.')
            case '5'    % Code 465
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, first pulse.')
            case '6'    % Code 466
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, second pulse.')
            case '7'    % Code 467
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 460
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '47'   % Function createHighSpeedSequence(char*,int,int,int,int)
        disp('   - Error creating high speed sequence:')
        
        switch codeChar(3)
            case '1'    % Code 471
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 472
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 473
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode.')
            case '4'    % Code 474
                disp('     - Call to UltraSonix function "addLine" failed in linear mode.')
            case '5'    % Code 475
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 470
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '48'   % Function createDopplerSequence(char*,int,int)
        disp('   - Error creating Doppler sequence:')
        
        switch codeChar(3)
            case '1'    % Code 481
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 482
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 483
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode.')
            case '4'    % Code 484
                disp('     - Call to UltraSonix function "addLine" failed in linear mode.')
            case '5'    % Code 485
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 480
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end
        
    case '49'   % Function createMDopplerSequence(char*,int)
        disp('   - Error creating MDoppler sequence:')
        
        switch codeChar(3)
            case '1'    % Code 491
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 492
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '3'    % Code 493
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, B-mode image.')
            case '4'    % Code 494
                disp('     - Call to UltraSonix function "addLine" failed in sectorial mode, repeating centre.')
            case '5'    % Code 495
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, B-mode image.')
            case '6'    % Code 496
                disp('     - Call to UltraSonix function "addLine" failed in linear mode, repeating centre.')
            case '7'    % Code 497
                disp('     - Call to UltraSonix function "addSequence" failed.')
            case '0'    % Code 490
                disp('     - General error: sequence was not created.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end

    % CODES BEGINNING WITH 4 BELONG TO TLSEQUENCER FUNCTIONS (CUSTOM SEQUENCES)
        
    case '51'   % Function beginSequence()
        disp('   - Error beginning sequence definition:')
        
        switch codeChar(3)
            case '1'    % Code 511
                disp('     - Scanner not ready -- already imaging or not present or not initialised.')
            case '2'    % Code 512
                disp('     - Call to UltraSonix function "beginSequence" failed.')
            case '0'    % Code 510
                disp('     - General error: sequence definition was not started.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end

    case '52'   % Function addLine()
        disp('   - Error adding line to sequence definition:')
        
        switch codeChar(3)
            case '1'    % Code 521
                disp('     - Sequence definition has not begun.')
            case '2'    % Code 522
                disp('     - Call to UltraSonix function "addLine" failed.')
            case '0'    % Code 520
                disp('     - General error: line was not added to sequence.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end

    case '53'   % Function endSequence()
        disp('   - Error ending sequence definition:')
        
        switch codeChar(3)
            case '1'    % Code 531
                disp('     - Sequence definition has not begun.')
            case '2'    % Code 532
                disp('     - Call to UltraSonix function "endSequence" failed.')
            case '0'    % Code 530
                disp('     - General error: sequence definition was not ended.')
            otherwise
                disp(['     - Unknown error = ', codeChar, '.'])
        end

        
        
    % UNEXPECTED CODES

    otherwise
        disp(['   - Unknown error = ', codeChar, '.']);

end

