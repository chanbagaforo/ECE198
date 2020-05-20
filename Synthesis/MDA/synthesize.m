clear all;
partial
close all;

addpath('MFiles');

NperFrame = round(dt*Fs);
Nf = length(amp);
sig = zeros(NperFrame*Nf/1000,1); % added "/1000" - Christian

for j  = 1:numel(sbin) %per partial
    [amp,freq,Fs,DispLen,Sample_Offset,dt] = modalest(filename,sbin(j),ebin(j));
                % amp contains amplitude estimate
                % freq contains frequency estimate
                % Fs is the sampling frequency
                % dt is the time interval
    dt = dt/1000;
    par = sosinterp(amp, freq, Fs, dt);
    sig = sig + par;
end

[~,name,~] = fileparts(file);
audiowrite(char(strcat(name,'.wav')), sig, Fs);