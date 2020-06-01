%% ampfreq.m
close all
% plots amplitude spectrum
%       frequency spectrum
%       spectrogram
% takes fundamental frequency with respect to time

% Created by Jhaezminne Gayo for ECE 198 February 2020
%% original signal
% plot amplitude and frequency 

%[y_orig, Fs] = audioread('A6.wav');
[file,path] = uigetfile('*.wav','Select .wav file to analyze');%,...
%     'Multiselect','on'); % file select
file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

[y_orig,Fs] = audioread([char(path) char(file)]);

y_orig = y_orig(:,1); %convert to mono 

% %pitch 
% [f0_orig,idx] = pitch(y_orig,Fs);
%  
%         t_ = (0:length(y_orig)-1)/Fs;
%         t0 = (idx - 1)/Fs;
%         fig0 = figure;
%         subplot(2,1,1); plot(t_,y_orig)
%         title('Input audio signal (time domain)')
%         subplot(2,1,2); plot(t0,f0_orig)
%         title('Pitch of input audio signal wrt time')
%         xlabel('Time (s)')
%         ylabel('Pitch (Hz)')
%         ylim([50 400])
%         saveas(fig0, [char(path) char(name) ' - Pitch of Original Signal'], 'jpeg')
% 
% t = linspace(0, length(y_orig)/Fs , length(y_orig));

%time domain plot
fig1 = figure; 
plot(t,y_orig)
    title('Time Domain')
    xlabel('time (s)')
    ylabel('amplitude')
saveas(fig1,[char(path) char(name) ' - Time Domain'], 'jpeg')

%frequency domain plot
N = length(y_orig);
dF = Fs/N;

Y_orig = abs(fftshift(fft(y_orig))); 
t_fft = -Fs/2:dF:Fs/2-dF + (dF/2)*mod(N,2);
%t_fft = -length(y_orig)/2:(length(y_orig)/2)-1;
fig2 = figure;
plot(t_fft, Y_orig)
    title('Frequency Domain');
    xlabel('frequency (Hz)');
    ylabel('amplitude')
saveas(fig2, [char(path) char(name) ' - Frequency Domain'], 'jpeg')
saveas(fig2, [char(path) char(name) ' - Frequency Domain.fig'])


% %spectrogram
% 
% fig3 = figure; 
% spectrogram(y_orig);
%     title('Spectrogram');
%     xlabel('time (s)');
%     ylabel('frequency')    
% saveas(fig3, [char(path) char(name) ' - Spectrogram'], 'jpeg')

%% synthesized
 
% plot amplitude and frequency 
[file,path] = uigetfile('*.wav','Select .wav file of synthesis to analyze');%,...
%     'Multiselect','on'); % file select
file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

[y,Fs] = audioread([char(path) char(file)]);

y = y(:,1); %convert to mono

% [f0_synth,idx] = pitch(y,Fs);
%  
%         t_ = (0:length(y)-1)/Fs;
%         t0 = (idx - 1)/Fs;
%         fig0 = figure;
%         subplot(2,1,1); plot(t_,y)
%         title('Synthesized audio signal (time domain)')
%         subplot(2,1,2); plot(t0,f0_synth)
%         title('Pitch of synthesized signal wrt time')
%         xlabel('Time (s)')
%         ylabel('Pitch (Hz)')
%         %ylim([50 200])
%         saveas(fig0, [char(path) char(name) ' - Pitch of Synthesized Signal'], 'jpeg')
% t = linspace(0, length(y)/Fs , length(y));

%time domain plot
fig1 = figure; 
plot(t,y)
    title('Time Domain - Synthesized ')
    xlabel('time (s)')
    ylabel('amplitude')
saveas(fig1, [char(path) char(name) ' - Time Domain (Synthesized)'], 'jpeg')

%frequency domain plot
N = length(y);
dF = Fs/N;

Y = abs(fftshift(fft(y))); 
t_fft = -Fs/2:dF:Fs/2-dF + (dF/2)*mod(N,2);
%t_fft = -length(y)/2:(length(y)/2)-1;
fig2 = figure;
plot(t_fft, Y)
    title('Frequency Domain - Synthesized');
    xlabel('frequency (Hz)');
    ylabel('amplitude')
saveas(fig2, [char(path) char(name) ' - Frequency Domain (Synthesized)'], 'jpeg')
saveas(fig2, [char(path) char(name) ' - Frequency Domain (Synthesized).fig'])


% %spectrogram
% 
% fig3 = figure; 
% spectrogram(y);
%     title('Spectrogram- Synthesized ');
%     xlabel('time (s)');
%     ylabel('frequency')    
% saveas(fig3, [char(path) char(name) ' - Spectrogram (Synthesized)'], 'jpeg')

%% superimpose 

%time domain
fig1 = figure;
plot(t,y_orig(1:length(y))); hold on 
plot(t,y)
legend('original', 'synthesized')
    title('Time Domain - Original and Synthesized')
    xlabel('time (s)')
    ylabel('amplitude')
hold off;

% %pitch
% fig2 = figure;
% plot(t0,f0_orig); hold on; 
% plot(t0,f0_synth)
% legend('original', 'synthesized')
%         title('Pitch of original and synthesized signal wrt time')
%         xlabel('Time (s)')
%         ylabel('Pitch (Hz)')
% hold off;

%FFT 
fig3 = figure;
plot(t,Y_orig(1:length(y))); hold on 
plot(t,Y)
legend('original', 'synthesized')
    title('Frequency Domain - Original and Synthesized')
    xlabel('frequency (Hz)')
    ylabel('amplitude')
hold off;