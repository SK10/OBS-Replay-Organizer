# OBS-Replay-Organizer
Autohotkey script for organizing obs replay buffers in a way similar to Nvidia ShadowPlay.
Basically when you save a replay buffer the script will create a folder with the same name of your active window, then move the replay to that folder. Similar to how shadowplay creates a folder for each game when you save an instant replay.

## Requirements
* [AutoHotkey](https://www.autohotkey.com) 
* [WatchFolder](https://github.com/AHK-just-me/WatchFolder/blob/master/Sources/WatchFolder.ahk)

## Installing
Download the latest [release](https://github.com/SK10/OBS-Replay-Organizer/releases), extract it and run OBSRO.ahk file.

## How to Use
When you first run the script you will be asked to enter your OBS recording path, once you do that you should be good to go.
Please note that your replay buffer filename prefix must be "Replay" in order for this script to work.
To start OBSRO with Windows do the following :
  - Right click the OBSRO file and click the "Create Shortcut" option from the menu
  - Press Win + R 
  - Type shell:startup
  - Copy the shortcut file to the folder and the script will start automatically with windows.

## Licenses
[![GNU AGPLv3 Image](https://www.gnu.org/graphics/agplv3-155x51.png)](https://www.gnu.org/licenses/agpl-3.0.html)  

* OBS-Replay-Organizer is Free Software: You can use, study share and improve it at your
will. Specifically you can redistribute and/or modify it under the terms of the
[GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.html) as
published by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.  

* WatchFolder [License](https://github.com/AHK-just-me/WatchFolder/blob/master/LICENSE) 

* The [notification sound](https://notificationsounds.com/message-tones/juntos-607) [License](https://creativecommons.org/licenses/by/4.0/legalcode) 
