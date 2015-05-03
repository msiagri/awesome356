# awesome356

## Awesome ver. 3.5.6 windows manager

## Widgets 

Here same widgets modified to work in awesome version 3.5.6 

## diskusage widget file:diskusage.lua 
 
#### Screenshot
 ![diskusage ](https://github.com/msiagri/awesome356/blob/master/screenshots/Aw-356-diskusage.png?raw=true "diskusage widget awesome 3.5.6")

#### diskusage widget installation 

include diskusage in your awesome config file rc.lua 

```lua
local diskusage = require("diskusage")
```
configure diskusage widget in Wibox section 

```lua
-- {{{ Wibox
-- {{{ Widgets configuration
```

diskusage is added to diskwidget a imageboxbox widget  

```lua
  --- diskusage widget
  diskwidget = wibox.widget.imagebox()
  diskwidget:set_image(awful.util.getdir("config") .. "/du.png")
  diskusage = require("diskusage")
  -- the first argument is the widget to trigger the diskusage
  -- the second/third is the percentage at which a line gets orange/red
  -- true = show only local filesystems
  diskusage.addToWidget(diskwidget, 75, 90, false)
```

Add diskusage in Widgets that are aligned to the right 

```lua
-- Widgets that are aligned to the right
   right_layout:add(diskwidget)
```


## calendar widget file:calendar356.lua module calendar356

 
#### Screenshots
 ![calendar ](https://github.com/msiagri/awesome356/blob/master/screenshots/Aw-356-calendar356.png?raw=true "calendar widget awesome 3.5.6")
 
months calendar stacked  
 
 ![calendar ](https://github.com/msiagri/awesome356/blob/master/screenshots/Aw-356-calendar356-stacked.png?raw=true "calendar widget awesome 3.5.6")
 
#### calendar widget installation module calendar356

include calendar356 in your awesome config file rc.lua 

```lua
local calendar356 = require("calendar356")
```
configure calendar356 widget in Wibox section 

```lua
-- {{{ Wibox
-- {{{ Widgets configuration
```

```lua
-- Create a textclock widget
mytextclock = awful.widget.textclock("%a %b %d, %R:%S ")
```

calendar356 is added to mytextclock a textclock widget  

```lua
-- calendar356 module calendar356
-- Calendar widget to attach to the textclock
  calendar356.addCalendarToWidget(mytextclock)
```

```lua
-- Widgets that are aligned to the right
 ...
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])
 ```
