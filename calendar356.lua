-- original code made by Bzed and published on http://awesome.naquadah.org/wiki/Calendar_widget
-- modified by Marc Dequènes (Duck) <Duck@DuckCorp.org> (2009-12-29), under the same licence,
-- and with the following changes:
--   + transformed to module
--   + the current day formating is customizable
--  modified by M. Siagri to work on awesome 3.5.6 
--   + show stacked months calendar using <ctrl> key ( months at the same time )

local string = string
--local print = print
local tostring = tostring
local os = os
local capi = {
    mouse = mouse,
    screen = screen
}
local awful = require("awful")
local naughty = require("naughty")
-- aw 3.4 ori
-- module("calendar")
-- aw 3.5.6
module("calendar356")

local calendar = {}
local current_day_format = "<span color='orange'><u>%s</u></span>"

function displayMonth(month,year,weekStart)
        local t,wkSt=os.time{year=year, month=month+1, day=0},weekStart or 1
        local d=os.date("*t",t)
        local mthDays,stDay=d.day,(d.wday-d.day-wkSt+1)%7

        --print(mthDays .."\n" .. stDay)
        local lines = "    "

        for x=0,6 do
                lines = lines .. os.date("%a ",os.time{year=2006,month=1,day=x+wkSt})
        end

        lines = lines .. "\n" .. os.date(" %V",os.time{year=year,month=month,day=1})

        local writeLine = 1
        while writeLine < (stDay + 1) do
                lines = lines .. "    "
                writeLine = writeLine + 1
        end

        for d=1,mthDays do
                local x = d
                local t = os.time{year=year,month=month,day=d}
                if writeLine == 8 then
                        writeLine = 1
                        lines = lines .. "\n" .. os.date(" %V",t)
                end
                if os.date("%Y-%m-%d") == os.date("%Y-%m-%d", t) then
                        x = string.format(current_day_format, d)
                end
                if (#(tostring(d)) == 1) then
                        x = " " .. x
                end
                lines = lines .. "  " .. x
                writeLine = writeLine + 1
        end
        local header = os.date("%B %Y\n",os.time{year=year,month=month,day=1})

        return header .. "\n" .. lines
end
 -- modified permit to show months at the same time using <Control> key
function switchNaughtyMonth(switchMonths, stackMonths)
        if (#calendar < 3) then return end
        local swMonths = switchMonths or 1
        calendar[1] = calendar[1] + swMonths
        -- aw 3.4 
        -- calendar[3].box.widgets[2].text = string.format('<span font_desc="%s">%s</span>', "monospace", displayMonth(calendar[1], calendar[2], 2))
        -- aw 3.5.6 
	if ( stackMonths ~= 1 ) then naughty.destroy(calendar[3]) end	 
	calendar = { calendar[1],calendar[2],
        naughty.notify({
                text = string.format('<span font_desc="%s">%s</span>', "monospace", displayMonth(calendar[1], calendar[2], 2)),
                timeout = 0,
                hover_timeout = 0.5,
                screen = capi.mouse.screen
        })
}	
end

function addCalendarToWidget(mywidget, custom_current_day_format)
  if custom_current_day_format then current_day_format = custom_current_day_format end

  -- aw 3.4   
  -- mywidget:add_signal('mouse::enter', function ()
  -- aw 3.5.6 new
  mywidget:connect_signal('mouse::enter', function ()
        local month, year = os.date('%m'), os.date('%Y')
        calendar = { month, year,
        naughty.notify({
                text = string.format('<span font_desc="%s">%s</span>', "monospace", displayMonth(month, year, 2)),
                timeout = 0,
                hover_timeout = 0.5,
                screen = capi.mouse.screen
        })
  }
  end)
  -- aw 3.4 
  -- mywidget:add_signal('mouse::leave', function () naughty.destroy(calendar[3]) end)
  -- aw 3.5.6 new
  mywidget:connect_signal('mouse::leave', function () naughty.destroy(calendar[3]) end)

  mywidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function()
        switchNaughtyMonth(-1)
    end),
    awful.button({ }, 3, function()
        switchNaughtyMonth(1)
    end),
    awful.button({ }, 4, function()
        switchNaughtyMonth(-1)
    end),
    awful.button({ }, 5, function()
        switchNaughtyMonth(1)
    end),
    awful.button({ 'Shift' }, 1, function()
        switchNaughtyMonth(-12)
    end),
    awful.button({ 'Shift' }, 3, function()
        switchNaughtyMonth(12)
    end),
    awful.button({ 'Shift' }, 4, function()
        switchNaughtyMonth(-12)
    end),
    awful.button({ 'Shift' }, 5, function()
        switchNaughtyMonth(12)
    end),    
    -- permit to show more months at the same time  
     awful.button({'Control' }, 1, function()
        switchNaughtyMonth(-1, 1)
    end),
    awful.button({'Control'  }, 3, function()
        switchNaughtyMonth(1, 1)
    end),
    awful.button({'Control'  }, 4, function()
        switchNaughtyMonth(-1, 1)
    end),
    awful.button({'Control'  }, 5, function()
        switchNaughtyMonth(1, 1)
    end),
    awful.button({ 'Shift', 'Control'  }, 1, function()
        switchNaughtyMonth(-12, 1)
    end),
    awful.button({ 'Shift', 'Control'   }, 3, function()
        switchNaughtyMonthShift(12, 1)
    end),
    awful.button({ 'Shift' }, 4, function()
        switchNaughtyMonth(-12, 1)
    end),
    awful.button({ 'Shift' }, 5, function()
        switchNaughtyMonth(12, 1)
    end)   
    
  ))
end

