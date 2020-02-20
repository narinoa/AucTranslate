local search = stateMainForm:GetChildChecked( "ContextAuction", false ):GetChildChecked( "Main", false ):GetChildChecked( "Search", false )
local searchbarname = search:GetChildChecked( "searchbar.name", false )
local Button = mainForm:GetChildChecked( "Button", false )
Button:SetVal("button_label", userMods.ToWString("RU"))
search:AddChild(Button)

local p = searchbarname:GetPlacementPlain()
p.sizeX = 370
searchbarname:SetPlacementPlain(p) 


local ReplaceTable = {
["q"] = "�",
["w"] = "�",
["e"] = "�",
["r"] = "�",
["t"] = "�",
["y"] = "�",
["u"] = "�",
["i"] = "�",
["o"] = "�",
["p"] = "�",
["["] = "�",
["]"] = "�",
["a"] = "�",
["s"] = "�",
["d"] = "�",
["f"] = "�",
["g"] = "�",
["h"] = "�",
["j"] = "�",
["k"] = "�",
["l"] = "�",
[";"] = "�",
["'"] = "�",
["z"] = "�",
["x"] = "�",
["c"] = "�",
["v"] = "�",
["b"] = "�",
["n"] = "�",
["m"] = "�",
[","] = "�",
["."] = "�",
["`"] = "�",

["Q"] = "�",
["W"] = "�",
["E"] = "�",
["R"] = "�",
["T"] = "�",
["Y"] = "�",
["U"] = "�",
["I"] = "�",
["O"] = "�",
["P"] = "�",
["{"] = "�",
["}"] = "�",
["A"] = "�",
["S"] = "�",
["D"] = "�",
["F"] = "�",
["G"] = "�",
["H"] = "�",
["J"] = "�",
["K"] = "�",
["L"] = "�",
[":"] = "�",
['"'] = "�",
["Z"] = "�",
["X"] = "�",
["C"] = "�",
["V"] = "�",
["B"] = "�",
["N"] = "�",
["M"] = "�",
["<"] = "�",
[">"] = "�",
["~"] = "�",
}

function Translate(s, t)
    return s:gsub("%g",
        function(m)
            if ReplaceTable[m] == nil then return m else return ReplaceTable[m] end
        end 
    )
end

function TranslateText()
if not search:IsVisible() then return end
local searchline = stateMainForm:GetChildChecked("ContextAuction", false):GetChildChecked("searchbar.name.edit", true)
local text = searchline:GetString()
	local convert = Translate(text,ReplaceTable)
	searchline:SetText(userMods.ToWString(convert))
end

function Init()
	common.RegisterReactionHandler( TranslateText, "LEFT_CLICK" )
end

if (avatar.IsExist()) then Init()
else common.RegisterEventHandler(Init, "EVENT_AVATAR_CREATED")	
end