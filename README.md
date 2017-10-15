# MarbleMadnessAutoSplitter
Auto Splitter for Marble Madness NES

- [LiveSplit](http://livesplit.github.io/) - Here you can find out more about and download LiveSplit. It is a popular timer program typically used for speedruns.
- [ASL](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md) - Here you can find more information about ASL (basically C#) and autosplitters in general.

**Supported emulators:**
 - FCEUX 2.2.3
 
## Features

- Automatically start the timer when you start a run. Timer starts after selecting the Control Type
- Automatically reset the timer when you restart the game (or load a savestate to before Control Type selection)
- Automatically split when the marble crosses a goal line or when a level loads (runner's choice)

## Installation

- Go to "Edit Splits.." in LiveSplit
- Enter the name of the game in "Game Name"
  - This must be entered correctly for LiveSplit to know which script to load
- Click the "Activate" button to download and enable the autosplitter script
  - If you ever want to stop using the autosplitter altogether, just click "Desactivate"
  
## Set-up

- Go to "Edit Splits..." in LiveSplit
- Click "Settings" to configure the autosplitter
  - **Note:** If for some reason LiveSplit does not automatically load the script, click "Browse...", navigate to "\LiveSplit\Components\" and select the appropriate script.
- Set "Start Timer At" to "-6.606" so the timer starts exactly when you gain control of the marble. (the third digit won't show up in the GUI once you save and come back but it's correctly saved in the .lss file)
  
Here you can enable/disable the options for auto start, auto reset, and auto splitting.

## Contact

If you encounter any issues or have feature requests, please let me know! 

- [saturnin55](http://twitch.tv/saturnin55) or saturnin55#2730 on Discord
