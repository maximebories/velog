# Velog

Mentor Graphics Veloce® log plot tool.

![alt text](https://raw.githubusercontent.com/maximebories/velog/master/probe.png "Example")

## Requirements

 - perl
 - awk
 - octave
 - zenity

## Usage

Extract probes data from the transcript:

	$ ./velog.sh transcript.txt

Plot data with Octave:

	$ run velog.m

Two dialog box will ask you to select which probres you wish to plot, and which should be interpreted as signed:
	
![alt text](https://raw.githubusercontent.com/maximebories/velog/master/dialog.png "Dialog")

That selection will be kept in the *state.txt*. To reset, simply delete that file.
