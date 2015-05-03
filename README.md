# awesome356

Awesome windows manager 3.5.6 

Widgets 

Here same widgets modified to work in awesome version 3.5.6 

- diskusage.lua  
 ![diskusage ](https://github.com/msiagri/awesome356/blob/master/screenshots/Aw-356-diskusage.png?raw=true "diskusage widget awesome 3.5.6")
 
-- {{{ Wibox
-- {{{ Widgets configuration
...
...
...

  --- Disk usage widget
  diskwidget = wibox.widget.imagebox()
  diskwidget:set_image(awful.util.getdir("config") .. "/du.png")
  disk = require("diskusage")
  -- the first argument is the widget to trigger the diskusage
  -- the second/third is the percentage at which a line gets orange/red
  -- true = show only local filesystems
  disk.addToWidget(diskwidget, 75, 90, false)
...
...
...

-- Widgets that are aligned to the right
   right_layout:add(diskwidget)
...
...


- calendar 
