%% BAGAFORO, CHRISTIAN APRIL P.
% EE 286 Exercise 1

clear all;
close all;


[x,Fs] = audioread('04-2b.wav');
x = x(:,2);

t = 0:1/Fs:length(x)/Fs; %set the time variable
%x = chirp(t,500,1,750,'linear'); %generate chirp

% Q: Given the chirp, what is the expected instantaneous frequency after 2 seconds?
% -- According to the 'chirp' function in the MathWorks website, the function earlier
% declared that at time 0 the chirp is as 500 Hz while at time 1 (second), the
% chirp is 750 Hz. Since the function increases frequency linearly, at 2
% seconds, the instantaneous frequency is 1000 Hz.
% -- 1000 Hz


%soundsc(x,8000);

% Q: What can you say about the pitch of the signal?
% -- The pitch of the signal increases in frequency linearly.

% Now, let's try to analyze the frequency content of the signal using conventional method.

% X=fft(x); %apply DFT on the signal
% F=linspace(0,Fs,length(x)); %create x-axis for plotting the spectrum
% plot(F,abs(X)./length(x)*2); %plot the magnitude spectrum

L = (1/200)*Fs*10; %segment size in samples
step=L-1; %hop size of segments in samples, 50% overlap
NFFT=256; %number of FFT points computed per segment
%Fs=8000; %sampling rate
N=length(x); K=fix((N-L+step)/step);
w=hanning(L); time=(1:L)';
N2=NFFT/2+1; S=zeros(K,N2);
for k=1:K
    xw=x(time)'.*w; %multiply each segment by Hanning window to reduce spectral leakage
    X=fft(xw,NFFT);
    X1=X(1:N2)';
    S(k,1:N2)=X1.*conj(X1);
    time=time+step;
end
S=fliplr(S)'; S=S/max(max(S));
%colormap(1-gray); %use this for grayscale
colormap(jet);
tk=(0:K-1)'*step/Fs; F=(0:NFFT/2)'*Fs/NFFT;
surf(tk,flipud(F),20*log10(S))
% imagesc(tk,flipud(F),20*log10(S),[-100 0]); axis xy
 xlabel('time (sec)')
 ylabel('frequency (Hz)')