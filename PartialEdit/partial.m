clear
clc

%% Wrapper for MDA partial estimation etc. functions
%   made by Frank Agsaway for his thesis
%
% Created by Victor Gabriel C. Garica for CoE 198 2s1920
% Edited by Jhaezminne S. Gayo, ECE 198, February 2020
% Edited by Christian April Bagaforo, ECE 198, February 2020

addpath('MFiles');

[file,path] = uigetfile('*.bin','Select MDA .bin file(s) to analyze',...
    'Multiselect','on'); % file select

%     [FILENAME, PATHNAME] = uigetfile(..., 'MultiSelect', SELECTMODE)
%     specifies if multiple file selection is enabled for the uigetfile
%     dialog. Valid values for SELECTMODE are 'on' and 'off'. If the value of
%     'MultiSelect' is set to 'on', the dialog box supports multiple file
%     selection. 'MultiSelect' is set to 'off' by default.
%  
%     The output variable FILENAME is a cell array of strings if multiple
%     filenames are selected. Otherwise, it is a string representing
%     the selected filename.
file = string(file);
path = string(path);

if ~strcmp(file,"0") & ~strcmp(path,"0")
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
        
        for j = 1:numel(sbin) % per partial
            [amp,freq,Fs,DispLen,Sample_Offset, dt] = modalest(filename,sbin(j),ebin(j));
                % amp contains amplitude estimate
                % freq contains frequency estimate
                % Fs is the sampling frequency
                % dt is [CHECK THE IMPLEMENTATION - GINO]
            
            % make time vector and correct length
            t = (Sample_Offset:DispLen-Sample_Offset)./Fs;
            t = t(1:min(numel(t),numel(amp)));
            
            tmp = strcat(file," - Partial ",num2str(j)); % title
            fignum = figure('Name',tmp); % new figure for given partial
            tg = uitabgroup(fignum); % tab group ui element
            
            tab1 = uitab(tg,'Title','Amplitude'); % tab for amplitude
            axes('Parent',tab1);
            plot(t,amp);
            title('Amplitude','Interpreter','none');
            xlabel('time [s]');
            ylabel('magnitude, normalized');
            
            tab2 = uitab(tg,'Title','Frequency'); % tab for frequency
            axes('Parent',tab2);
            figure(fignum); 
            plot(t,freq);
            title('Frequency','Interpreter','none');
            xlabel('time[s]');
            ylabel('frequency [Hz]');
        end
    end
else
    disp('Analysis cancelled');
end

%clear;
rmpath('MFiles');