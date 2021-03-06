% Wrapper for MDA partial estimation etc. functions
%   made by Frank Agsaway for his thesis
%
% Created by Victor Gabriel C. Garica for CoE 198 2s1920

% removed plotting - Christian

%close all
%clear all
%clc

addpath('MFiles');

[file,path] = uigetfile('*.bin','Select MDA .bin file(s) to analyze',...
    'Multiselect','on'); % file select
file = string(file);
path = string(path);
% global file; global path;
    

if ~strcmp(file,"0") & ~strcmp(path,"0")
%    dBtol = 50;
    dBtol = inputdlg('Input dB tolerance for magnitude of partials:',...
        'Enter dB tolerance',...
        1,...
        {'30'}); % dB attentuation wrt max tolerance (for peak finding)
    dBtol = str2num(cell2mat(dBtol)); % convert to integer
    if isempty(dBtol) % empty case
        dBtol = 30;
    end

    for i = 1:numel(file)
        filename = [char(path) char(file(i))];
        [sbin,ebin] = GetBoundaries(filename,dBtol); % bins of partial bounds

        
        partials = numel(sbin)
        [amp,freq,Fs,DispLen,Sample_Offset,dt] = modalest(filename,sbin(1),ebin(1));
%         for j = 1:numel(sbin) % per partial
%             [amp,freq,Fs,DispLen,Sample_Offset,dt] = modalest(filename,sbin(j),ebin(j));
% %                 % amp contains amplitude estimate
% %                 % freq contains frequency estimate
% %                 % Fs is the sampling frequency
% %                 % dt is [CHECK THE IMPLEMENTATION - GINO]
% %            COMMENTED OUT FOR SYNTHESIS PURPOSES
%             
%             % make time vector and correct length
%             t = (Sample_Offset:DispLen-Sample_Offset)./Fs;
%             t = t(1:min(numel(t),numel(amp)));
%             
%             tmp = strcat(file," - Partial ",num2str(j)); % title
%             fignum = figure('Name',tmp); % new figure for given partial
%             tg = uitabgroup(fignum); % tab group ui element
%             
%             tab1 = uitab(tg,'Title','Amplitude'); % tab for amplitude
%             axes('Parent',tab1);
%             plot(t,amp);
%             title('Amplitude','Interpreter','none');
%             xlabel('time [s]');
%             ylabel('magnitude, normalized');
%             
%             tab2 = uitab(tg,'Title','Frequency'); % tab for frequency
%             axes('Parent',tab2);
%             figure(fignum); 
%             plot(t,freq);
%             title('Frequency','Interpreter','none');
%             xlabel('time[s]');
%             ylabel('frequency [Hz]');
%         end
    end
else
    disp('Analysis cancelled');
end

%clear;
%rmpath('MFiles');