clear all; close all;

[y,fs] = audioread('04-2b.wav');
y = y(:,2);
t = 0:1/fs:length(y)/fs;

%fs = 1000;
%t = 0:1/fs:2;
%y = sin(128*pi*t) + sin(256*pi*t); % sine of periods 64 and 128.
%level = 6;
 
%igure;
windowsize = round((1/200)*fs*4);
window = hanning(windowsize);
nfft = 256;
noverlap = windowsize-1;
[S,F,T] = spectrogram(y,window,noverlap,nfft,fs);
%spectrogram(y,window,noverlap,nfft,fs)

surf(T,F,log10(abs(S)),'LineStyle','none')
ylim([0 2000])
% hold on
% imagesc(T,fliplr(F),log10(abs(S))-10)
% hold off
% %set(gca,'YDir','Normal')
xlabel('Time (secs)')
ylabel('Freq (Hz)')
zlabel('Magnitude (dB)')
title('Short-time Fourier Transform spectrum')
