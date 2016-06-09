require "iuplua"
require "iupluacontrols"

--[[

Simple Lua Menus and functions

]]--

-- Buttons
btn1 = iup.button{title = "Text color"}
btn2 = iup.button{title = "Background"}
text = iup.multiline {expand="YES"}

-- Menu

item_open = iup.item {title = "Open"}
item_exit = iup.item {title = "Exit"}
item_help = iup.item {title = "Help"}

-- Creates menus of the main menu

menu_file = iup.menu {item_open, iup.separator{}, item_exit }
menu_help = iup.menu {item_help}

-- Sub Menu

submenu_file = iup.submenu {menu_file; title = "File"}
submenu_help = iup.submenu {menu_help; title = "About"}


function btn1:action ()


    r, g, b = iup.GetColor(100, 100, 255, 255, 255)

	if (r) then

	text.FGCOLOR = r.." "..g.." "..b

	end

end




function btn2:action ()



    r, g, b = iup.GetColor(100, 100, 255, 255, 255)

	if (r) then

	text.BGCOLOR = r.." "..g.." "..b

	end
end



function item_open:action()
    f, err = iup.GetFile("*.txt")

	local ifile = io.open(f, "r")
	if (not ifile) then
		iup.message("Error", "Can't open file: " .. f)
		return nil
	end

	local str = ifile:read("*a")
	text.value = str
	ifile:close()

end



function item_exit:action()

  return iup.CLOSE

end

menu = iup.menu {submenu_file, submenu_help}
box = iup.hbox {btn1, btn2, text; gap = 4}
dlg = iup.dialog{box; title="Lab7", menu = menu, size="QUARTERxQUARTER"}



dlg:showxy(iup.CENTER,iup.CENTER)



iup.MainLoop()
