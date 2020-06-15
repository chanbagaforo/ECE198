%% addnoise.m 

%final processing for listening test
%     - normalize signal
%     - 0.9 amplitude
%     - additive white noise 
clear
close all
clc
%% Load sample
[file,path] = uigetfile('*.wav','Select .wav file to add noise');%,...
%     'Multiselect','on'); % file select
file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

[x,Fs] = audioread([char(path) char(file)]);
x = x/max(x);
x = 0.9*x;

%% remove silence 
i1=find(x,1,'last');
x=x(1:i1);

%% Generate noise
%original signal
noise = 0.001*wgn(length(x), 1, 5, 50, 'dBm');

%% Add noise 
x_noise = noise + x; 

%% save file
[~,name,~] = fileparts(file);
audiowrite(char(strcat(name,'_noisy.wav')), x_noise, Fs);
sound(x_noise, Fs)