clear all; close all;

[y,fs] = audioread('12.wav');
y = y(:,2);
t = 0:1/fs:length(y)/fs;

windowsize = 2^12;
window = hanning(windowsize);
nfft = 256;
noverlap = windowsize*0.5;
% [S,F,T] = spectrogram(y,window,noverlap,nfft,fs);
spectrogram(y,window,noverlap,nfft,fs)
view(25,35)
zlabel('Power/frequency dB/Hz')
% 
% surf(T,F,log10(abs(S)),'LineStyle','none')
% ylim([0 2000])
% % hold on
% % imagesc(T,fliplr(F),log10(abs(S))-10)
% % hold off
% % %set(gca,'YDir','Normal')
% xlabel('Time (secs)')
% ylabel('Freq (Hz)')
% zlabel('Magnitude (dB)')
% title('Short-time Fourier Transform spectrum')
