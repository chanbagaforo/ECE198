        %  ampenv.m
%
%  Extracts the amplitude envelope from the original instrument recording
%  using hilbert() and envelope()

%  Convolves the extracted amplitude envelope to the presynthesized signal

%  Created by Jhaezminne S. Gayo, ECE 198, March 2020
clear all;
close all;
clc;
%% Original Signal
[file_orig,path_orig] = uigetfile('*.wav','Select .wav file for the original signal',...
    'Multiselect','on'); % file select
file_orig = string(file_orig);
path_orig = string(path_orig);

%% Synthesized signal
[file_synth,path_synth] = uigetfile('*.wav','Select .wav file for the synthesized signal',...
    'Multiselect','on'); % file select
file_synth = string(file_synth);
path_synth = string(path_synth);

if numel(file_synth) == numel(file_orig)
    if (~strcmp(file_orig,"0") & ~strcmp(path_orig,"0")) & (~strcmp(file_synth,"0") & ~strcmp(path_synth,"0"))
        for i = 1:numel(file_synth)
            [x,Fs] = audioread([char(path_orig) char(file_orig(i))]);
            
            [~,name,~] = fileparts(file_orig(i));
            
            x = x(:,1); %mono
            %x = x/max(x);
            [x_synth,Fs] = audioread([char(path_synth) char(file_synth(i))]);
            %x_synth = x_synth/max(x_synth);
            t_synth = (linspace(0, length(x_synth)/Fs, length(x_synth)))';

            x = x(1:length(x_synth)); 
            t = (linspace(0, length(x)/Fs, length(x)))';

%             figure; 
%             subplot(2,1,1), plot(t_synth, x_synth); title('Synthesized Sample')
%             subplot(2,1,2), plot(t, x); title('Original Signal')

            %% Extracting Envelopes 
            fl = 500;

            [up,lo] = envelope(x,fl,'peak'); %upper and lower amplitude envelopes of the original signal 
            [up_synth,lo_synth] = envelope(x_synth,fl,'peak'); %upper and lower amplitude envelopes of the pre-synthesized signal

%             tlim = 1.5*Fs;
            % figure; 
            % subplot(2,1,1), plot(t(1:tlim), up(1:tlim)); hold on; plot(t(1:tlim),lo(1:tlim)); hold off
            % title('upper and lower envelopes of original signal')
            % subplot(2,1,2), plot(t(1:tlim), up_synth(1:tlim)); hold on; plot(t(1:tlim),lo_synth(1:tlim)); hold off
            % title('upper and lower envelopes of synthesized signal')

            %% Compare Amplitude Envelopes or Original and Synthesized Samples  
            fig_env = figure; 
            hold on
            plot1 = plot(t, up);
            plot2 = plot(t, up_synth);
            hold off

            legend([plot1 plot2],'Original Signal','Synthesized Signal')
            title('Amplitude Envelopes')
            xlabel('time')
            ylabel('amplitude')
            
            saveas(fig_env,[char(path_orig) char(name) ' - Envelope'], 'fig');
            saveas(fig_env,[char(path_orig) char(name) ' - Envelope'], 'png');
        end
    else
        disp('Analysis cancelled')
    end
else
    disp('Not the same number of files selected')
end

% %% Envelopes for Onset Compensation   
% %up
% [maxval, index] = max(up(1:Fs)); 
% up_cut = up(1:index);
% up_conv = [up_cut; ones(length(x_synth)-length(up_cut),1)];
% figure; plot(up_conv)
% 
% % lo
% [minval, index_lo] = min(lo(1:Fs));
% lo_cut = lo(1:index_lo);
% lo_conv = [lo_cut; ones(length(x_synth)-length(lo_cut), 1)];
% figure; plot(lo_conv)
% 
% %% Convolve
% sig_adsr = x_synth.*up_conv;
% sig_adsr = sig_adsr.*lo_conv;
% sig_adsr = sig_adsr / max(sig_adsr);
% %sig_adsr = sig_adsr(1000:length(sig_adsr));
% sig_adsr = 0.8*sig_adsr;
% %sig_adsr = [sig_adsr; zeros(length(x_synth)-length(sig_adsr), 1)];
% plot(t_synth, sig_adsr)
% 
% %% Extract SYNTH2 amplitude envelope 
% [up_adsr,lo_adsr] = envelope(sig_adsr,fl,'peak');
% 
% % Compare Amplitude Envelopes (Plot) 
% figure; 
% hold on
% plot1 = plot(t(1:tlim), up(1:tlim))
% plot2 = plot(t(1:tlim), up_synth(1:tlim))
% plot3 = plot(t(1:tlim), up_adsr(1:tlim))
% hold off
% legend('original signal', 'pre-synthesized', 'synthesized')
% title('Effect of onset compensation in the pre-synthesized signal')
% %% sound test synth_final
% sound(sig_adsr,Fs) 
% %% sound test original signal
% % sound(x,Fs)
% 
% %% save synth signal
% 
% [~,name,~] = fileparts(file);
% audiowrite(char(strcat(name,'_adsr.wav')), sig_adsr, Fs);
% 
% %% correlation 
% R = corrcoef(x, sig_adsr);
