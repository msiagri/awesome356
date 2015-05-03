# awesome356

Awesome windows manager 3.5.6 

# Widgets 

Here same widgets modified to work in awesome version 3.5.6 

## widget: diskusage.lua 
 
### Screenshot
 ![diskusage ](https://github.com/msiagri/awesome356/blob/master/screenshots/Aw-356-diskusage.png?raw=true "diskusage widget awesome 3.5.6")

### diskusage widget installation 

include diskusage in your awesome config file rc.lua 

```lua
local diskusage = require("diskusage")
```
in Wibox section 

```lua
-- {{{ Wibox
-- {{{ Widgets configuration
```
configure diskusage widget  

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


- calendar 
