function sig_fin = subsynth(filename)

%SUBSYNTH(FILENAME)
%performs subtractive sythesis on the pre synthesized signal 
%FILENAME = 'audiofile.wav' 
% Created by Jhaezminne Gayo for ECE 198 February 2020

[y, Fs] = audioread(filename);

fl = 270;
fh = 1000;

Fpass = [fl, fh];
sig_sub = bandpass(y, Fpass, Fs);

[f0,idx] = pitch(sig_sub,Fs);
 
        t_ = (0:length(sig_sub)-1)/Fs;
        t0 = (idx - 1)/Fs;
        figure;
        subplot(2,1,1); plot(t_,sig_sub)
        title('Filtered synthesized audio signal (time domain)')
        subplot(2,1,2); plot(t0,f0)
        title('Pitch of filtered synthesized audio signal wrt time')
        xlabel('Time (s)')
        ylabel('Pitch (Hz)')
        %ylim([50 400])
