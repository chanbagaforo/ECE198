function sig = sossynth(filename, workspace)
% SOSSYNTH(FILENAME, WORKSPACE)
%   synthesize signal from its MD  saved in FILENAME.BIN
%   and the obtained parameters saved in WORKSPACE.MAT generated by
%   PARTIAL.M
%
% Adapted from Frank Agsaway's synth.m
% Created by Jhaezminne Gayo for ECE 198 February 2020
% Edited by Christian April Bagaforo for ECE 198 February 2020

partial
%close all;

addpath('MFiles');

NperFrame = round(dt*Fs);
Nf = length(amp);
sig = zeros(NperFrame*Nf/1000,1);
sig = 0; 
for j  = 1:numel(sbin) %per partial
    [amp,freq,Fs, DispLen,Sample_Offset, dt] = modalest(filename,sbin(j),ebin(j));
                % amp contains amplitude estimate
                % freq contains frequency estimate
                % Fs is the sampling frequency
                % dt is the time interval   
    dt = dt/ 1000;
    par = sosinterp(amp, freq, Fs, dt); 
    sig = sig + par; 
    
end

audiowrite('A1_synth.wav', sig, Fs);
