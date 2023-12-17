
clear all;
close all;
clc;

% Initialise the library:
[saveFolder, configFolder, libraryFolder, settingsFolder] = openPaths();
initTexoMatlabLibrary(libraryFolder);

try
    % Prepare the scanner:
    startEngine(settingsFolder, 40);
    configFile = [configFolder, 'HalfDepthConfig.txt'];
    loadConfigData(configFile);

    returnScannerSettings(true);
    displayScannerSettings(TML_ScannerSettings);

    setPower(13, 13, 13);

    returnScannerSettings(true);
    displayScannerSettings(TML_ScannerSettings);

    % Create a sequence:
    createStandardSequence('+');

    returnScannerSettings(true);
    displayScannerSettings(TML_ScannerSettings);
    
    % Take the image and save the data:
    takeScan(2500);
    saveFile = [saveFolder, 'StandardSequence2.bin'];

    saveData(saveFile, 3);

    % Stop the engine and close the library:
    stopEngine();

catch
    disp('   - Error: Texo procedure failed.');
    disp('   - Attempting to stop engine and recover...');
    stopEngine();
    pause(2);
end

closeTexoMatlabLibrary;

% Process the data:
[data, properties] = readSavedFile(saveFile);

frame = data(1:properties.nbLines, :);

figure;
imagesc(log(1+abs(hilbert(frame'))));
colormap(gray);
