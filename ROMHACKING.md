## Some notes about the ROM [Marble Madness (USA).nes] :

- **Emulator** : FCEUX 2.2.3

- **Base Address** : `0x00efb4b0`   (shouldn't be hard to find the base address for other emulator. Just use Cheat Engine and find the
                               timer variable, lookup to find the pointer to that variable)
                               
  
## Interesting Offsets (are all 1 byte unsigned)

- **`0x5f` : status** 
    - before starting = 0 (in menu, crossed the goal line, or between levels)
    - when a level is starting = 255  
    - will be set to the current level when going past the goal line
    - when going in some pipe (like the last one in Beginner) = 1
    
- **`0x34` : level**
    - current level, changes when a new level is loaded.
    - is at 0 when in the menus (select # of players, enter name, control type)
    - when crossing the goal line, this is set to the current level (except for Practice because it's already at 0)
    
- **`0x8b` : end_of_level**
    - 1 : level is not finished
    - 0 : goal line crossed
    
- **`0x44` : timer** (max displayed on screen is 99)

- **`0x41` : control type** 
    - 0 = 90°
    - 1 = 45°

- **`0x7b` :** *means you are in a situation where you can't control your marble, like in a pipe or past the goal line*
    - 0 : you can control the marble normally
    - 255 : marble broke or you fell from too high
    - 1 : you got eathen by a worm, roll into acid, etc.
    
- **`0x0b` : dpad key pressed** 
    - 1 : Right
    - 2 : Left
    - 4 : Down
    - 8 : Up
    - 16 : Start
    - 32 : Select
    - 64 : B
    - 128 : A
