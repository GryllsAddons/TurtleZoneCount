local turtle = (TargetHPText or TargetHPPercText)
if not turtle then
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff98Turtle|cffe6b300ZoneCount|r: This addon will only function correctly for Turtle WoW.")
    return
end

local TZC = CreateFrame("Button", "TZC", Minimap)
TZC:Hide()

TZC:SetFrameLevel(64)
TZC:SetFrameStrata("MEDIUM")
TZC:SetWidth(102)
TZC:SetHeight(86)
TZC:SetBackdrop({
  bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  tile = true, tileSize = 8, edgeSize = 16,
  insets = { left = 3, right = 3, top = 3, bottom = 3 }
})
TZC:SetBackdropBorderColor(.9,.8,.5,1)
TZC:SetBackdropColor(.4,.4,.4,1)

TZC:SetMovable(true)
TZC:SetClampedToScreen(true)
TZC:SetUserPlaced(true)

function TZC:position()
    TZC:ClearAllPoints()
    TZC:SetPoint("TOP", Minimap, "BOTTOM", 0, -42)
end

TZC.title = CreateFrame("Button", nil, TZC)

TZC.title:SetWidth(TZC:GetWidth())
TZC.title:SetHeight(18)
TZC.title:SetPoint("TOPLEFT", TZC, "TOPLEFT", 0, -4)
TZC.title:EnableMouse(true)
TZC.title:RegisterForClicks("RightButtonDown")
TZC.title:RegisterForDrag("LeftButton")

TZC.title.text = TZC:CreateFontString("Status", "LOW", "GameFontNormal")
TZC.title.text:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
TZC.title.text:SetAllPoints(TZC.title)
TZC.title.text:SetText("Waiting")

TZC.efaction = CreateFrame("Button", nil, TZC)

TZC.efaction.button = CreateFrame("Button", nil, TZC.efaction)
TZC.efaction.button:EnableMouse(true) 
TZC.efaction.button:SetWidth(TZC:GetWidth())
TZC.efaction.button:SetHeight(18)
TZC.efaction.button:SetPoint("TOPLEFT", TZC.title, "BOTTOMLEFT", 7, -0)

TZC.efaction.icon = TZC:CreateTexture(nil, 'ARTWORK')
TZC.efaction.icon:SetWidth(18)
TZC.efaction.icon:SetHeight(18)
TZC.efaction.icon:SetPoint("LEFT", TZC.efaction.button, "LEFT", 0, 0)

TZC.efaction.border = CreateFrame("Frame", nil, TZC.efaction)
TZC.efaction.border:SetPoint("TOPLEFT", TZC.efaction.icon, "TOPLEFT", -2, 2)
TZC.efaction.border:SetPoint("BOTTOMRIGHT", TZC.efaction.icon, "BOTTOMRIGHT", 2, -2)
TZC.efaction.border:SetBackdrop({edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12})

TZC.efaction.text = TZC:CreateFontString("Status", "LOW", "GameFontNormal")
TZC.efaction.text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
TZC.efaction.text:SetPoint("LEFT", TZC.efaction.icon, "RIGHT", 2, 0)
TZC.efaction.text:SetFontObject(GameFontWhite)

TZC.faction = CreateFrame("Button", nil, TZC)

TZC.faction.button = CreateFrame("Button", nil, TZC.faction)
TZC.faction.button:EnableMouse(true) 
TZC.faction.button:SetWidth(TZC:GetWidth())
TZC.faction.button:SetHeight(18)
TZC.faction.button:SetPoint("TOPLEFT", TZC.efaction.icon, "BOTTOMLEFT", 0, -2)

TZC.faction.icon = TZC:CreateTexture(nil, 'ARTWORK')
TZC.faction.icon:SetWidth(18)
TZC.faction.icon:SetHeight(18)
TZC.faction.icon:SetPoint("LEFT", TZC.faction.button, "LEFT", 0, 0)

TZC.faction.border = CreateFrame("Frame", nil, TZC.faction)
TZC.faction.border:SetPoint("TOPLEFT", TZC.faction.icon, "TOPLEFT", -2, 2)
TZC.faction.border:SetPoint("BOTTOMRIGHT", TZC.faction.icon, "BOTTOMRIGHT", 2, -2)
TZC.faction.border:SetBackdrop({edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12})

TZC.faction.text = TZC:CreateFontString("Status", "LOW", "GameFontNormal")
TZC.faction.text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
TZC.faction.text:SetPoint("LEFT", TZC.faction.icon, "RIGHT", 2, 0)
TZC.faction.text:SetFontObject(GameFontWhite)

TZC.friend = CreateFrame("Button", nil, TZC)

TZC.friend.button = CreateFrame("Button", nil, TZC.friend)
TZC.friend.button:EnableMouse(true) 
TZC.friend.button:SetWidth(TZC:GetWidth())
TZC.friend.button:SetHeight(18)
TZC.friend.button:SetPoint("TOPLEFT", TZC.faction.icon, "BOTTOMLEFT", 0, -2)

TZC.friend.icon = TZC:CreateTexture(nil, 'ARTWORK')
TZC.friend.icon:SetWidth(18)
TZC.friend.icon:SetHeight(18)
TZC.friend.icon:SetPoint("LEFT", TZC.friend.button, "LEFT", 0, 0)
TZC.friend.icon:SetTexture("Interface\\Icons\\Spell_Shadow_Charm")

TZC.friend.border = CreateFrame("Frame", nil, TZC.friend)
TZC.friend.border:SetPoint("TOPLEFT", TZC.friend.icon, "TOPLEFT", -2, 2)
TZC.friend.border:SetPoint("BOTTOMRIGHT", TZC.friend.icon, "BOTTOMRIGHT", 2, -2)
TZC.friend.border:SetBackdrop({edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12})
TZC.friend.border:SetBackdropBorderColor(1,1,1)

TZC.friend.text = TZC:CreateFontString("Status", "LOW", "GameFontNormal")
TZC.friend.text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
TZC.friend.text:SetPoint("LEFT", TZC.friend.icon, "RIGHT", 2, 0)
TZC.friend.text:SetFontObject(GameFontWhite)

function TZC:setIcons(faction)
    -- Inv_bannerpvp_01 = Horde icon
    -- Inv_bannerpvp_02 = Alliance icon
    if faction == "Alliance" then
        TZC.efaction.name = "Horde"
        TZC.efaction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_01")
        TZC.efaction.border:SetBackdropBorderColor(1,0.1,0.1)
        TZC.faction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_02")    
        TZC.faction.border:SetBackdropBorderColor(0,0.44,0.87)
    elseif faction == "Horde" then
        TZC.efaction.name = "Alliance"        
        TZC.efaction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_02")
        TZC.efaction.border:SetBackdropBorderColor(0,0.44,0.87)
        TZC.faction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_01")
        TZC.faction.border:SetBackdropBorderColor(1,0.1,0.1)
    end
end

TZC:position()

local refreshTime = GetTime() + 5
local refreshInterval = 60

local qFaction
local queried
local queriedMan
local openFaction
local openFriends

local _PlaySound = PlaySound
local pass = function() end

function TZC:maxWho(count)
    if count == nil then
        return 0 
    elseif count >= 49 then
        return "49+"
    else
        return count
    end
end

function TZC:color(faction)
    if faction == "Alliance" then
        return "|cff3FC7EB"
        -- 0,.44,.87
    elseif faction == "Horde" then
        return "|cffFF2020"
        -- 1,.1,.1
    end
end

function TZC:updateFactionText(faction)
    local color = TZC:color(qFaction)
    if faction.count == 0 then
        faction.text:SetText(color.."0")
    else
        faction.text:SetText(color..faction.count.."|r |cffFF7D01"..faction.higher.."|r/|cffFFFC01"..faction.lower)
    end
end

function TZC:updateFriendsText()
    local friends = TZC.friends or 0
    TZC.friend.text:SetText(friends)
end

function TZC:sendWho(faction, manual)
    qFaction = faction
    local filter
    
    if faction == "Alliance" then
        filter = "z-"..TZC.zone.." r-Human r-Dwarf r-Gnome r-Elf"
    elseif faction == "Horde" then
        filter = "z-"..TZC.zone.." r-Orc r-Troll r-Goblin r-Tauren r-Undead"        
    end

    if not manual then
        if filter and (not FriendsFrame:IsVisible()) then        
            PlaySound = pass
            SendWho(filter)              
            queried = true           
        end
    elseif manual then
        if filter then
            queried = true
            queriedMan = true
            SendWho(filter)
        end
    end
    --  DEFAULT_CHAT_FRAME:AddMessage("DEBUG: queried "..qFaction)
end

function TZC:openWho(faction)
    if faction ~= openFaction then
        openFaction = faction
        openFriends = nil
        ShowWhoPanel()
    elseif not openFriends then    
        HideUIPanel(FriendsFrame)
        openFaction = nil
    end    
end

function TZC:openFriends()
    if FriendsFrame:IsVisible() and not openFaction then
        openFriends = nil
        HideUIPanel(FriendsFrame)
    else
        openFriends = true
        openFaction = nil
        HideUIPanel(FriendsFrame)
        PanelTemplates_SetTab(FriendsFrame, 1)
        ShowUIPanel(FriendsFrame)
    end
end

function TZC:refreshTime()
    refreshTime = GetTime() + refreshInterval
end

function TZC:whoInfo()
    local faction
    if qFaction == TZC.faction.name then
        faction = TZC.faction
    else
        faction = TZC.efaction
    end

    local plvl = UnitLevel("player") 
    local llvl, hlvl = 0, 0
    local levels = { [60] = 0, [50] = 0, [40] = 0, [30] = 0, [20] = 0, [10] = 0, [1] = 0 }

    local pcount = GetNumWhoResults()
    if pcount > 0 then
        for i=0, pcount do
            local _, _, level = GetWhoInfo(i)
            if level >= 1 then                                
                if level <= plvl then
                    llvl = llvl + 1
                else
                    hlvl = hlvl + 1
                end

                if level == 60 then
                    levels[60] = levels[60] + 1
                elseif level >=50 then
                    levels[50] = levels[50] + 1
                elseif level >=40 then
                    levels[40] = levels[40] + 1
                elseif level >=30 then
                    levels[30] = levels[30] + 1
                elseif level >=20 then
                    levels[20] = levels[20] + 1
                elseif level >=10 then
                    levels[10] = levels[10] + 1
                elseif level >=1 then
                    levels[1] = levels[1] + 1
                end
            end
        end
    end    

    faction.count = TZC:maxWho(pcount)
    faction.lower = llvl
    faction.higher = hlvl
    faction.levels = levels   
    
    TZC:updateFactionText(faction)

    if qFaction == TZC.efaction.name then
        TZC:updateZoneFriends()
        TZC:updateFriendsText()
    end
end

function TZC:updateZoneFriends()
    local friends = 0
    local tfriends = {}

	for i=0, GetNumFriends() do
		local name, _, _, area = GetFriendInfo(i)
		if (area == TZC.zone) then
			friends = friends + 1
            table.insert(tfriends, name)
		end
	end

    TZC.friends = friends
    TZC.tfriends = tfriends
end

function TZC:update()
    qFaction = TZC.faction.name
    TZC.title.text:SetText(TZC.zone)
    TZC:sendWho(qFaction)
    TZC:refreshTime()
end

TZC:SetScript("OnUpdate", function()
    if (refreshTime) and (GetTime() > refreshTime) then
        TZC:update()
    end
end)

function TZC:tooltip(faction)
    if not faction.count then return end
    if not GameTooltip:IsShown() then 
        GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)
    end
    local color = TZC:color(faction.name)
    GameTooltip:ClearLines()   
    GameTooltip:AddDoubleLine(color..faction.name, color..faction.count)
    if faction.levels[60] > 0 then GameTooltip:AddDoubleLine("60", faction.levels[60], 1,1,1,1,1,1) end
    if faction.levels[50] > 0 then GameTooltip:AddDoubleLine("50-59", faction.levels[50], 1,1,1,1,1,1) end
    if faction.levels[40] > 0 then GameTooltip:AddDoubleLine("40-49", faction.levels[40], 1,1,1,1,1,1) end
    if faction.levels[30] > 0 then GameTooltip:AddDoubleLine("30-39", faction.levels[30], 1,1,1,1,1,1) end
    if faction.levels[20] > 0 then GameTooltip:AddDoubleLine("20-29", faction.levels[20], 1,1,1,1,1,1) end
    if faction.levels[10] > 0 then GameTooltip:AddDoubleLine("10-19", faction.levels[10], 1,1,1,1,1,1) end
    if faction.levels[1] > 0 then GameTooltip:AddDoubleLine("1-9", faction.levels[1], 1,1,1,1,1,1) end
    GameTooltip:Show()
end

function TZC:friendtooltip()
    if not TZC.friends then return end
    if not GameTooltip:IsShown() then 
        GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)
    end
    GameTooltip:ClearLines()
    GameTooltip:AddDoubleLine("Friends", TZC.friends)
    for _, friend in pairs(TZC.tfriends) do
		GameTooltip:AddLine("|cffffffff"..friend)
	end
    GameTooltip:Show()
end

TZC.efaction.button:SetScript("OnClick", function()
    TZC.emouse = true    
    TZC:sendWho(TZC.efaction.name, true)
end)

TZC.efaction.button:SetScript("OnEnter", function()
    TZC.emouse = true
    TZC:tooltip(TZC.efaction)
end)

TZC.efaction.button:SetScript("OnLeave", function()
    TZC.emouse = nil
    GameTooltip:Hide()
end)

TZC.faction.button:SetScript("OnClick", function()
    TZC.fmouse = true
    TZC:sendWho(TZC.faction.name, true)
end)

TZC.faction.button:SetScript("OnEnter", function()
    TZC.fmouse = true
    TZC:tooltip(TZC.faction)
end)

TZC.faction.button:SetScript("OnLeave", function()
    TZC.fmouse = nil
    GameTooltip:Hide()
end)

TZC.friend.button:SetScript("OnClick", function()
    GameTooltip:Hide()
    TZC:openFriends()
    TZC:updateZoneFriends()
    TZC:updateFriendsText()
    TZC:friendtooltip()
end)

TZC.friend.button:SetScript("OnEnter", function()
    TZC:friendtooltip()
end)

TZC.friend.button:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

TZC.title:SetScript("OnDragStart", function()
    if (IsShiftKeyDown() and IsControlKeyDown()) then
        TZC:StartMoving()
    end
end)

TZC.title:SetScript("OnDragStop", function()
    TZC:StopMovingOrSizing()
end)

TZC.title:SetScript("OnClick", function()
    if (IsShiftKeyDown() and IsControlKeyDown()) then
        TZC:SetUserPlaced(false)        
        TZC:position()
    end
end)

TZC:RegisterEvent("MINIMAP_ZONE_CHANGED")
TZC:RegisterEvent("WHO_LIST_UPDATE")
TZC:RegisterEvent("PLAYER_ENTERING_WORLD")

TZC:SetScript("OnEvent", function()
    if event == "MINIMAP_ZONE_CHANGED" then
        local zone = GetRealZoneText()
        if zone ~= TZC.zone then
            TZC.zone = zone
            TZC:update()
        end
    elseif event == "WHO_LIST_UPDATE" then
        if queried then
            queried = nil            
            TZC:whoInfo()
            if not queriedMan then
                HideUIPanel(FriendsFrame)
                PlaySound = _PlaySound
                if qFaction == TZC.faction.name then
                    TZC:sendWho(TZC.efaction.name)
                end
            elseif queriedMan then
                queriedMan = nil
                TZC:openWho(qFaction)
                if TZC.fmouse then
                    TZC.fmouse = nil
                    TZC:tooltip(TZC.faction)
                elseif TZC.emouse then
                    TZC.emouse = nil
                    TZC:tooltip(TZC.efaction)
                end
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        TZC.zone = GetRealZoneText()      
        if not this.loaded then
            this.loaded = true
            TZC.faction.name = UnitFactionGroup("player")
            TZC:setIcons(TZC.faction.name)
            TZC:Show()
        end        
    end
end)

local HookChatFrame_OnEvent = ChatFrame_OnEvent
function ChatFrame_OnEvent(event)    
	if (event == "CHAT_MSG_SYSTEM") then
        if queried then            
            -- Example of /who result messages:
            -- 1 player total
            -- 3 players total
            
            local _, _, result = string.find(arg1,"(%d+) player.- total")

            if result then                
                TZC:whoInfo()
                if not queriedMan then
                    PlaySound = _PlaySound
                    if qFaction == TZC.faction.name then
                        TZC:sendWho(TZC.efaction.name)
                        return
                    end
                elseif queriedMan then
                    queriedMan = nil
                    TZC:openWho(qFaction)
                    if TZC.fmouse then
                        TZC.fmouse = nil
                        TZC:tooltip(TZC.faction)
                    elseif TZC.emouse then
                        TZC.emouse = nil
                        TZC:tooltip(TZC.efaction)
                    end
                end
            end           
           
            if not result then 
                return
            else
                queried = nil
                return
            end 
        end
    end
    HookChatFrame_OnEvent(event)
end