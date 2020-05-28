close all; clear all;
feq = [211.9 260.6 288.9 331.6 378.3 435.5 520.4 585 666.4 773.9 891 924.9 50 50 50 50 50 50 50 50 50 50 50 50];

for hijk = 13:24
    global fc; global file; global path;
fc = feq(hijk)
file = string(strcat(num2str(hijk),'.bin'));
path = string('/Users/christianbagaforo/Desktop/ECE198/Synthesis/Trial synthesis 2 (tongali)/158_denoise_norm/');
partial

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
sig = sig/max(abs(sig));

[~,name,~] = fileparts(file);
audiowrite(char(strcat(path,name,'.wav')), sig, Fs);
end