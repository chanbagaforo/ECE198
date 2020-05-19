freq = 216.9; %fundamental
fs = 44100;
t = 0:1/fs:2;

s0 = sin(2*pi*t*freq) * 63.15;
s1 = sin(2*pi*t*freq*2) * 19.5;
s2 = sin(2*pi*t*freq*3) * 2.721;
s3 = sin(2*pi*t*freq*4) * 0.9531;
s4 = sin(2*pi*t*freq*5) * 0.3906;

signal = (s0+s1+s2+s3+s4)/max([s0 s1 s2 s3 s4]);
sound(signal,fs);