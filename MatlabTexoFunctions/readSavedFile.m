function [data, properties] = readSavedFile(fileName, frameIndex)
% 
% function [data, properties] = readSavedFile(fileName)
% 
% Opens the saved file and reads the settings and saved frames
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

if(nargin==1)
    frameIndex = 1;
end

fid = fopen(fileName, 'r');

% data = fread(fid, 1024, 'int32');
% properties = 0;

% Read in the configurations in the header
headerSize = 0;

properties.frameSize = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.nbFrames = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.nbLines =  fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.nbDopplerLines = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.frameRate = fread(fid, 1, 'double');
headerSize = headerSize + 4;
properties.nbElements =  fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.sectorialProbe = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.scanningMode = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.subMode = fread(fid, 1, 'int32');
headerSize = headerSize + 4;

%     scanningMode 1 = basic RF mode
%                     1.1 = basic RF mode
%                     1.2 = high speed
%     scanningMode 2 = multi-pulse modes
%                     2.1 = inverting sequence
%                     2.2 = alternating sequence
%     scanningMode 3 = doppler modes
%                     3.1 = B-mode + Doppler repeat of center
%                     3.2 = doppler
%     scanningMode 4 = custom sequence

properties.samplingFreq = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.txFreq = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.txFocus = fread(fid, 1, 'int32');
headerSize = headerSize + 4;
properties.rxDepth = fread(fid, 1, 'int32');
headerSize = headerSize + 4;

% Read the rest of the blank 1kb header:
fread(fid, (1024-headerSize)/4, 'int32');

% Read all the frames of data:
properties.lineSize = round((properties.frameSize-4)/(2*properties.nbLines));
frameIndex = min([frameIndex, properties.nbFrames]);
% lecture des frames avant frame Index:
for i=1:(frameIndex-1)
    tag = fread(fid,1,'int32');
    dataWaste = (fread(fid, [properties.lineSize, properties.nbLines], 'short'));
end

tag = fread(fid,1,'int32');
data = (fread(fid, [properties.lineSize, properties.nbLines], 'short'));

for i=(frameIndex+1):properties.nbFrames
    tag = fread(fid,1,'int32');
    dataWaste = (fread(fid, [properties.lineSize, properties.nbLines], 'short'));
end

% Read the series of Tx centre elements:
properties.txCentreElement = zeros(properties.nbLines,1);

for i = 1:properties.nbLines
    properties.txCentreElement(i) = fread(fid, 1, 'int32');
end

% Read the series of Tx angles:
properties.txAngle = zeros(properties.nbLines,1);

for i = 1:properties.nbLines
    properties.txAngle(i) = fread(fid, 1, 'int32');
end

% Read the series of Rx centre elements:
properties.rxCentreElement = zeros(properties.nbLines,1);

for i = 1:properties.nbLines
    properties.rxCentreElement(i) = fread(fid, 1, 'int32');
end

% Read the series of Rx angles:
properties.rxAngle = zeros(properties.nbLines,1);

for i = 1:properties.nbLines
    properties.rxAngle(i) = fread(fid, 1, 'int32');
end

% Read the series of pulseShapes:
for i = 1:properties.nbLines
    j=1;
    tempChar = ' ';
    while tempChar ~= ';'
        tempChar = fread(fid, 1, 'uint8=>char');
        properties.pulseShape(i,j) = tempChar;
        j = j+1;
    end
end

fclose(fid);
data = data';
