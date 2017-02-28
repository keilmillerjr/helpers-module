# Helpers module for AttractMode front end

by [Keil Miller Jr](http://keilmillerjr.com)

## DESCRIPTION:

Helpers module is for the [AttractMode](http://attractmode.org) front end. It consists of a few common functions to supplement the default squirrel functions and aid in the creation of an AttractMode layout.

You may also want to include the [Debug module](https://github.com/keilmillerjr/debug-module) within your layout as this module will output errors to a log if included.

## Paths

You may need to change file paths as necessary as each platform (windows, mac, linux) has a slightly different directory structure.

## Install Files

1. Copy module files to `$HOME/.attract/modules/Helpers/`

## Usage

From within your layout, you can load the module. You may then use the functions provided in [module.nut](https://github.com/keilmillerjr/helpers-module/blob/master/module.nut)

Example:

```Squirrel
// --------------------
// Load Helpers Module
// --------------------
if (fe.load_module("Debug")) log <- Log(); // Include Debug Module So Errors Output To A Log
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
// Percentages of A Value
percentage(percent, value);

// Generate a pseudo-random boolean
randBool();

// Convert 0/1 and Yes/No to Boolean
toBool(x);

// Seperate X and Y Resolutions
// Example: if var = "640x480" and type = "height", splitRes will return an integer of 480
splitRes(var, type);

// Set Properties On An Object
setProperties(target, properties);
```

## Notes

The setProperties function is taken and slightly modified from liquid8d and his [forum post](http://forum.attractmode.org/index.php?topic=1107.msg8464#msg8464) on the AttractMode forum.

More functionality is expected as it meets my needs. If you have an idea of something to add that might benefit a wide range of layout developers, please join the AttractMode forum and send me a message.
