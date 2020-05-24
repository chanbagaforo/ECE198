%% logs
% May 20 - added envelope and increased the number of partials
% May 25 - added awgn

%%
freq = 440.3; %fundamental
fs = 44100;
harmonics = 10;

t = 0:1/fs:2;

sig = sin(2*pi*t*freq) * 3.4457 * exp(-1.319);
for s = 2:harmonics
    sig = sig + sin(2*pi*t*freq*s) * 3.4457 * exp(-1.319*s);
end

%add noise here

delay = 0.1;

envelope = [[0:1/fs:delay]/delay ones(1,(2-delay*2)*fs) [(delay-1/fs):-1/fs:0]/delay];



sig = sig.*envelope; %simple rise sustain fall envelope
sig = awgn([zeros(1,fs/4) sig zeros(1,fs/4)],40);
sig = sig/max(sig); %normalize

sound(sig,fs);
audiowrite('matlab_synth.wav',sig,fs);

%%
% Y = fft(sig);
% P2 = abs(Y/length(sig));
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
