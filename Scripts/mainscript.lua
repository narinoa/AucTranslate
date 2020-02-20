local search = stateMainForm:GetChildChecked( "ContextAuction", false ):GetChildChecked( "Main", false ):GetChildChecked( "Search", false )
local searchbarname = search:GetChildChecked( "searchbar.name", false )
local Button = mainForm:GetChildChecked( "Button", false )
Button:SetVal("button_label", userMods.ToWString("RU"))
search:AddChild(Button)

local p = searchbarname:GetPlacementPlain()
p.sizeX = 370
searchbarname:SetPlacementPlain(p) 


local ReplaceTable = {
["q"] = "é",
["w"] = "ö",
["e"] = "ó",
["r"] = "ê",
["t"] = "å",
["y"] = "í",
["u"] = "ã",
["i"] = "ø",
["o"] = "ù",
["p"] = "ç",
["["] = "õ",
["]"] = "ú",
["a"] = "ô",
["s"] = "û",
["d"] = "â",
["f"] = "à",
["g"] = "ï",
["h"] = "ð",
["j"] = "î",
["k"] = "ë",
["l"] = "ä",
[";"] = "æ",
["'"] = "ý",
["z"] = "ÿ",
["x"] = "÷",
["c"] = "ñ",
["v"] = "ì",
["b"] = "è",
["n"] = "ò",
["m"] = "ü",
[","] = "á",
["."] = "þ",
["`"] = "¸",

["Q"] = "É",
["W"] = "Ö",
["E"] = "Ó",
["R"] = "Ê",
["T"] = "Å",
["Y"] = "Í",
["U"] = "Ã",
["I"] = "Ø",
["O"] = "Ù",
["P"] = "Ç",
["{"] = "Õ",
["}"] = "Ú",
["A"] = "Ô",
["S"] = "Û",
["D"] = "Â",
["F"] = "À",
["G"] = "Ï",
["H"] = "Ð",
["J"] = "Î",
["K"] = "Ë",
["L"] = "Ä",
[":"] = "Æ",
['"'] = "Ý",
["Z"] = "ß",
["X"] = "×",
["C"] = "Ñ",
["V"] = "Ì",
["B"] = "È",
["N"] = "Ò",
["M"] = "Ü",
["<"] = "Á",
[">"] = "Þ",
["~"] = "¨",
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