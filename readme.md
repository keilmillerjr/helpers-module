# Helpers module for AttractMode front end

by [Keil Miller Jr](http://keilmillerjr.com)

## DESCRIPTION:

Helpers module is for the [AttractMode](http://attractmode.org) front end. It consists of a few common functions to supplement the default squirrel functions and aid in the creation of an AttractMode layout.

## Paths

You may need to change file paths as necessary as each platform (windows, mac, linux) has a slightly different directory structure.

## Install Files

1. Copy module files to `$HOME/.attract/modules/Helpers/`

## Usage

Functions can be called by their full or short name. Load the module within yout layout before any dependencies. All functions are global (stored in root table) so they can be called from anywhere without having to load the module again.

Example:

```Squirrel
// --------------------
// Load Helpers Module
// --------------------
fe.load_module("helpers");

// --------------------
// Example Using Some of The Helper Functions
// --------------------

local flw = fe.layout.width;
local flh = fe.layout.height;

// Use A Hash To Store Settings
local settings = {
  snap = {
    x = 0,
    y = 0,
    // Set Height And Width to 50% of flw And flh
    width = percent(50, flw),
    height = percent(50, flh),
  },
}

// Create Snap and Set Properties From Settings Hash
local snap = fe.add_artwork("snap", -1, -1, 1, 1);
  setProperties(snap, settings.snap);
```

#### Functions

```Squirrel
// Print Line
printLine(x);
printL(x);

// Percentages of A Value
percentage(percent, val=100);
per(percent, val=100);

// Generate a pseudo-random integer between 0 and max
randInteger(max);
randInt(max);

// Generate a pseudo-random boolean
randomBoolean();
randBool();

// Convert 0/1 and Yes/No to Boolean
toBoolean(x);
toBool(x);

// Seperate X and Y Resolutions From String
// Example: if var = "640x480" and type = "height", splitRes will return an integer of 480
splitResolution(var, type, separator="x");
splitRes(var, type, separator="x");

// Reverse X and Y Resolutions Within String
// Example: if var = "640x480", reverseRes will return an string of "480x640"
reverseResolution(var);
reverseRes(var);

// Is Layout In Vertical Orientation
isLayoutVertical();
isLayoutVert();

// Is Widescreen
// Warning: Attractmode calculates layout size with the screen width and height, not the window
isWidescreen();

// Set Properties On An Object
setProperties(target, properties);
setProps(target, properties);

// Shade Object
// Example: if val = 50, object will be shaded %50
function shadeObject(obj, val);
```

## Notes

The setProperties function is taken from liquid8d and his [forum post](http://forum.attractmode.org/index.php?topic=1107.msg8464#msg8464) on the AttractMode forum.

More functionality is expected as it meets my needs. If you have an idea of something to add that might benefit a wide range of layout developers, please join the AttractMode forum and send me a message, or issue a pull request.
