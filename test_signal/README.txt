test_signal.wav contains a stereo signal where both channels contain:
- 220 Hz sine, 0.2 amplitude, 3 sec, linear fadeout
- 440 Hz sine, 0.5 amplitude, 5 sec, 1/5 linear fadeout, 4/5 linear fadeout
- 880 Hz sine, 0.8 amplitude, 4 sec, 1/2 linear fadein, 1/2 linear fadeout
WAV (Microsoft) signed 16-bit PCM @ 44.1kHz

test_signal.bin is the output from Guevara's MDA program.
Contains MDA of test_signal.wav using largest transform size + all default params.

Delete all *.bin files in this folder to re-analyze using Guevara's MDA program.