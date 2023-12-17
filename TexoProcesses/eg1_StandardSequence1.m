
clear all;
close all;
clc;

% Initialise the library:
[saveFolder, configFolder, libraryFolder, settingsFolder] = openPaths();
initTexoMatlabLibrary(libraryFolder);

try
    % Prepare the scanner:
    startEngine(settingsFolder, 40);
    configFile = [configFolder, 'DefaultConfigFile.txt'];
    loadConfigData(configFile);

    % Create a sequence:
    createStandardSequence();
    
    returnScannerSettings(true);
    displayScannerSettings(TML_ScannerSettings);
    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, 'StandardSequence1.bin'];
    saveData(saveFile, 10);

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
[data, properties] = readSavedFile(saveFile, 5);

figure;
imagesc(log(1+abs(hilbert(data'))));
colormap(gray);
