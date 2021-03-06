%% ampfreq.m
close all; clear all;
% plots amplitude spectrum
%       frequency spectrum
%       spectrogram
% takes fundamental frequency with respect to time

% Created by Jhaezminne Gayo for ECE 198 February 2020

% Edited by Christian Bagaforo for use with tongali files
% - removed pitch
% - converted outputs to fig to be able to analyze in future


%% original signal
% plot amplitude and frequency 

[file,path] = uigetfile('*.wav','Select WAV file(s) to analyze',...
    'Multiselect','on'); % file select

file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

% [file,path] = uigetfile('*.wav','Select .wav file to analyze');%,...
% %     'Multiselect','on'); % file select
% file = string(file);
% path = string(path);


[y_orig,Fs] = audioread([char(path) char(file)]);

y_orig = y_orig(:,2); %obtains right side sound so that the sound obtained is the same as the sound analyzed

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
t = linspace(0, length(y_orig)/Fs , length(y_orig));

%time domain plot
fig1 = figure; 
plot(t,y_orig)
    title('Time Domain')
    xlabel('time (s)')
    ylabel('amplitude')
saveas(fig1,[char(path) char(name) ' - Time Domain'], 'fig')

%frequency domain plot
N = length(y_orig);
dF = Fs/N;

Y_orig = abs(fftshift(fft(y_orig))); 
t_fft_orig = -Fs/2:dF:Fs/2-dF + (dF/2)*mod(N,2);
%t_fft = -length(y_orig)/2:(length(y_orig)/2)-1;
fig2 = figure;
plot(t_fft_orig, Y_orig)
    title('Frequency Domain');
    xlabel('frequency (Hz)');
    ylabel('amplitude')
% saveas(fig2, [char(path) char(name) ' - Frequency Domain'], 'jpeg')
saveas(fig2, [char(path) char(name) ' - Frequency Domain'], 'fig')


%spectrogram

fig3 = figure; 
spectrogram(y_orig);
    title('Spectrogram');
    xlabel('time (s)');
    ylabel('frequency')    
saveas(fig3, [char(path) char(name) ' - Spectrogram'], 'fig')

%% synthesized
% plot amplitude and frequency 
 
%path = string('/Users/christianbagaforo/Desktop/ECE198/Synthesis/Tongali/Trial synthesis 2 (tongali)/Final audio files/synth/');

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
t = linspace(0, length(y)/Fs , length(y));

%time domain plot
fig1 = figure; 
plot(t,y)
    title('Time Domain - Synthesized ')
    xlabel('time (s)')
    ylabel('amplitude')
saveas(fig1, [char(path) char(name) ' - Time Domain (Synthesized)'], 'fig')

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
% saveas(fig2, [char(path) char(name) ' - Frequency Domain (Synthesized)'], 'jpeg')
saveas(fig2, [char(path) char(name) ' - Frequency Domain (Synthesized)'], 'fig')


%spectrogram

fig3 = figure; 
spectrogram(y);
    title('Spectrogram- Synthesized ');
    xlabel('time (s)');
    ylabel('frequency')    
saveas(fig3, [char(path) char(name) ' - Spectrogram (Synthesized)'], 'fig')

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
saveas(fig1, [char(path) char(name) ' - Superimposed Time Domain'], 'fig')

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
plot(t_fft_orig,Y_orig); hold on 
plot(t_fft,Y)
legend('original', 'synthesized')
    title('Frequency Domain - Original and Synthesized')
    xlabel('frequency (Hz)')
    ylabel('amplitude')
hold off;
saveas(fig3, [char(path) char(name) ' - Superimposed Frequency Domain'], 'fig')

close all; clear all;
%end