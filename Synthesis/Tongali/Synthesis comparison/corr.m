%% corr.m 
close all
clear all;
clc
% takes the correlation Coefficients

% Created by Jhaezminne Gayo for ECE 198 May 29 2020

%% Load original and synthesized signals 
[file,path] = uigetfile('*.wav','Select .wav file for the original signal');%,...
%     'Multiselect','on'); % file select
file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

[y_orig,Fs] = audioread([char(path) char(file)]);

y_orig = y_orig(:,1); %convert to mono 


%synthesized 
[file,path] = uigetfile('*.wav','Select .wav file for the synthesized signal');%,...
%     'Multiselect','on'); % file select
file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

[y_synth,Fs] = audioread([char(path) char(file)]);

y_synth = y_synth(:,1); %convert to mono 

%% Plot signals in time domain 
t = linspace(0, length(y_synth)/Fs , length(y_synth))';
figure; 
plot(t, y_orig(1:length(y_synth)))
hold on
plot(t, y_synth)
hold off
legend('original', 'synthesized')

%% Pad 0s at the start of synthesized signal
pad = zeros(length(y_orig)-length(y_synth),1);
y_synth = [pad; y_synth];

t2 = linspace(0, length(y_orig)/Fs, length(y_orig));
figure; 
plot(t2, y_orig)
hold on
plot(t2, y_synth)
hold off
legend('original', 'synthesized')

% %% Scatter Plot 
% figure;
% scatter(y_orig, y_synth)

%% Cross correlation coefficient 
R = corrcoef(y_orig, y_synth)

% %% Time delay between signals 
% [acor,lag] = xcorr(y_orig,y_synth);
% [~,I] = max(abs(acor));
% timeDiff = lag(I)         % sensor 2 leads sensor 1 by 350 samples
% subplot(311); plot(y_orig); title('original');
% subplot(312); plot(y_synth); title('synthesized');
% subplot(313); plot(lag,acor);
% title('Cross-correlation between original and synthesized')
