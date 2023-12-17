
clear all;
close all;
clc;

% Initialise the library:
[saveFolder, configFolder, libraryFolder, settingsFolder] = openPaths();
initTexoMatlabLibrary(libraryFolder);

% try
    % Prepare the scanner:
    startEngine(settingsFolder, 40);
    configFile = [configFolder, 'DefaultConfigFile.txt'];
    loadConfigData(configFile);
    
% ------------------------------------------------------------------ %

    disp(' ');
    disp(' --- USING INVERTING SEQUENCE ---');

    % Create a sequence:
    setLibraryVariable('frequency', 2e6);
    createInvertingSequence('+');

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, 'ScanDataInverting2MHz-09-05-29.bin'];
    saveData(saveFile, 1);

    % Process the data:
    [dataI2, propertiesI2] = readSavedFile(saveFile);

    for i=1:propertiesI2.nbLines/2
        frameI2(i,:) = dataI2(2*i,:);
    end

    figure;
    imagesc(log(1+abs(hilbert(frameI2'))));
    colormap(gray);

    figure;		% Check whether the alternate lines are truly inverses
    hold on
    plot(dataI2(127,:), 'r')
    plot(-dataI2(128,:), 'k')
    plot(dataI2(127,:)+dataI2(128,:), 'b')	% Should sum to zero

    figure;		% Check the Fourier spectrum
    hold on;
    plot(abs(hilbert(fft(dataI2(127,:)))),'r');
    plot(abs(hilbert(fft(dataI2(127,:)+dataI2(128,:)))),'k');

% ------------------------------------------------------------------ %

    disp(' ');
    disp(' --- USING INVERTING SEQUENCE ---');

    % Create a sequence:
    setLibraryVariable('frequency', 9.5e6);
    createInvertingSequence('+');

    % Take the image and save the data:
    takeScan();
    
    saveFile = [saveFolder, 'ScanDataInverting9_5MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataI9, propertiesI9] = readSavedFile(saveFile);
    
    for i=1:propertiesI9.nbLines/2
        frameI9(i,:) = dataI9(2*i,:);
    end

    figure;
    imagesc(log(1+abs(hilbert(frameI9'))));
    colormap(gray);

    figure;		% Check whether the alternate lines are truly inverses
    hold on
    plot(dataI9(127,:), 'r')
    plot(-dataI9(128,:), 'k')
    plot(dataI9(127,:)+dataI2(128,:), 'b')	% Should sum to zero

    figure;		% Check the Fourier spectrum
    hold on;
    plot(abs(hilbert(fft(dataI9(127,:)))),'r');
    plot(abs(hilbert(fft(dataI9(127,:)+dataI9(128,:)))),'k');

% ------------------------------------------------------------------ %

    disp(' ');
    disp(' --- USING STANDARD SEQUENCE ---');

    % Create a sequence:
    setLibraryVariable('frequency', 2e6);
    createStandardSequence('+-');

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataStandard2MHz-09-05-29.bin'];
    saveData(saveFile, 1);

    % Process the data:
    [dataS2, propertiesS2] = readSavedFile(saveFile);

    figure;
    imagesc(log(1+abs(hilbert(dataS2'))));
    colormap(gray);

% ------------------------------------------------------------------ %

    disp(' ');
    disp(' --- USING STANDARD SEQUENCE ---');

    % Create a sequence:
    setLibraryVariable('frequency', 9.5e6);
    createStandardSequence('+-');

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataStandard9_5MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataS9, propertiesS9] = readSavedFile(saveFile);

    figure;
    imagesc(log(1+abs(hilbert(dataS9'))));
    colormap(gray);

% ------------------------------------------------------------------ %
    
    disp(' ');
    disp(' --- USING DOPPLER SEQUENCE ---');

    % Create a sequence:
    lineNumber = 128;
    repeat = 3;
    setLibraryVariable('frequency', 2e6);
    createDopplerSequence('+-', lineNumber, repeat);

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataDoppler2MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataD2, propertiesD2] = readSavedFile(saveFile);
    
    for i=1:propertiesD2.nbLines/repeat
        frameD2(i,:) = dataD2(repeat*i,:);
    end

    figure;
    imagesc(log(1+abs(hilbert(frameD2'))));
    colormap(gray);

% ------------------------------------------------------------------ %
    
    disp(' ');
    disp(' --- USING DOPPLER SEQUENCE ---');

    % Create a sequence:
    lineNumber = 128;
    repeat = 3;
    setLibraryVariable('frequency', 9.5e6);
    createDopplerSequence('+-', lineNumber, repeat);

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataDoppler9_5MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataD9, propertiesD9] = readSavedFile(saveFile);
    
    for i=1:propertiesD9.nbLines/repeat
        frameD9(i,:) = dataD9(repeat*i,:);
    end

    figure;
    imagesc(log(1+abs(hilbert(frameD9'))));
    colormap(gray);

% ------------------------------------------------------------------ %
    
    disp(' ');
    disp(' --- USING MMODE DOPPLER SEQUENCE ---');

    % Create a sequence:
    repeatCenter = 50;
    setLibraryVariable('frequency', 2e6);
    createMDopplerSequence('+-', repeatCenter);

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataMMode2MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataM2, propertiesM2] = readSavedFile(saveFile);

    figure;
    imagesc(log(1+abs(hilbert(dataM2'))));
    colormap(gray);

% ------------------------------------------------------------------ %
    
    disp(' ');
    disp(' --- USING MMODE DOPPLER SEQUENCE ---');

    % Create a sequence:
    repeatCenter = 50;
    setLibraryVariable('frequency', 9.5e6);
    createMDopplerSequence('+-', repeatCenter);

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataMMode9_5MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataM9, propertiesM9] = readSavedFile(saveFile);

    figure;
    imagesc(log(1+abs(hilbert(dataM9'))));
    colormap(gray);

% ------------------------------------------------------------------ %
    
    disp(' ');
    disp(' --- USING HIGH SPEED SEQUENCE ---');

    % Create a sequence:
    numberLines = 128;
    depth = 60000;
    txFrequency = 2e6;
    focusDistance = 40000;
    setLibraryVariable('frequency', 2e6);
    createHighSpeedSequence('+-', numberLines, depth, txFrequency, focusDistance);

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataHighSpeed2MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataH2, propertiesH2] = readSavedFile(saveFile);

    figure;
    imagesc(log(1+abs(hilbert(dataH2'))));
    colormap(gray);

% ------------------------------------------------------------------ %
    
    disp(' ');
    disp(' --- USING HIGH SPEED SEQUENCE ---');

    % Create a sequence:
    numberLines = 128;
    depth = 60000;
    txFrequency = 9500000;
    focusDistance = 40000;
    setLibraryVariable('frequency', 9.5e6);
    createHighSpeedSequence('+-', numberLines, depth, txFrequency, focusDistance);

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, '\ScanDataHighSpeed9_5MHz-09-05-29.bin'];
    saveData(saveFile, 1);
    
    % Process the data:
    [dataH9, propertiesH9] = readSavedFile(saveFile);

    figure;
    imagesc(log(1+abs(hilbert(dataH9'))));
    colormap(gray);

% ------------------------------------------------------------------ %
    
    % Stop the engine and close the library:
    stopEngine();

% catch
%     disp('   - Error: Texo procedure failed.');
%     disp('   - Attempting to stop engine and recover...');
%     stopEngine();
%     pause(2);
% end

closeTexoMatlabLibrary;
