%% corr.m 
close all
clear all;
% takes the correlation Coefficients

% Created by Jhaezminne Gayo for ECE 198 May 29 2020
% Edited by Christian Bagaforo
%  - shifts y_synth to be able to compute correlation across different
%  delays

%% Load original and synthesized signals 
%original
[file,path] = uigetfile('*.wav','Select .wav file for the original signal');%,...
%     'Multiselect','on'); % file select
file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

[y_orig,Fs] = audioread([char(path) char(file)]);

y_orig = y_orig(:,2);

%synthesized 
[file,path] = uigetfile('*.wav','Select .wav file for the synthesized signal');%,...
%     'Multiselect','on'); % file select
file = string(file);
path = string(path);
[~,name,~] = fileparts(file);

[y_synth,Fs] = audioread([char(path) char(file)]);

R_temp = 0;
for i = 0:(length(y_orig)-length(y_synth))
    [y_synth,Fs] = audioread([char(path) char(file)]);
    y_synth = [zeros(i,1); y_synth;zeros((length(y_orig)-length(y_synth))-i,1)];
    R = corrcoef(y_orig, y_synth);
    if abs(R(2,1)) > abs(R_temp)
        R_temp = R(2,1);
    end
end

R = R_temp