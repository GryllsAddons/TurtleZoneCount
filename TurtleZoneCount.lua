TurtleZoneCount_Settings = {
    track = false
}

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

TZC.title:SetWidth(TZC:GetWidth()-12)
TZC.title:SetHeight(18)
TZC.title:SetPoint("TOP", TZC, "TOP", 0, -4)
TZC.title:EnableMouse(true)
TZC.title:RegisterForClicks("RightButtonDown")
TZC.title:RegisterForDrag("LeftButton")

TZC.title.refresh = TZC:CreateFontString("Status", "LOW", "GameFontNormal")
TZC.title.refresh:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
TZC.title.refresh:SetPoint("BOTTOM", TZC.title, "TOP", 0, 5)
TZC.title.refresh:SetText("Wait")
TZC.title.refresh:Hide()

TZC.title.text = TZC:CreateFontString("Status", "LOW", "GameFontNormal")
TZC.title.text:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
TZC.title.text:SetAllPoints(TZC.title)
TZC.title.text:SetText("Wait")

TZC.efaction = CreateFrame("Button", nil, TZC)

TZC.efaction.button = CreateFrame("Button", nil, TZC.efaction)
TZC.efaction.button:EnableMouse(true) 
TZC.efaction.button:SetWidth(TZC:GetWidth())
TZC.efaction.button:SetHeight(18)
TZC.efaction.button:SetPoint("TOPLEFT", TZC.title, "BOTTOMLEFT", 2, -0)

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

TZC.track = CreateFrame("Button", nil, TZC)
TZC.track:Hide()

TZC.track.button = CreateFrame("Button", nil, TZC.track)
TZC.track.button:EnableMouse(true) 
TZC.track.button:SetWidth(TZC:GetWidth())
TZC.track.button:SetHeight(18)
TZC.track.button:SetPoint("TOPLEFT", TZC.friend.icon, "BOTTOMLEFT", 0, -2)

TZC.track.icon = TZC:CreateTexture(nil, 'ARTWORK')
TZC.track.icon:SetWidth(18)
TZC.track.icon:SetHeight(18)
TZC.track.icon:SetPoint("LEFT", TZC.track.button, "LEFT", 0, 0)
TZC.track.icon:SetTexture("Interface\\Icons\\Ability_Hunter_SniperShot")
TZC.track.icon:SetParent(TZC.track)

TZC.track.border = CreateFrame("Frame", nil, TZC.track)
TZC.track.border:SetPoint("TOPLEFT", TZC.track.icon, "TOPLEFT", -2, 2)
TZC.track.border:SetPoint("BOTTOMRIGHT", TZC.track.icon, "BOTTOMRIGHT", 2, -2)
TZC.track.border:SetBackdrop({edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12})
TZC.track.border:SetBackdropBorderColor(1,0.1,0.1)

TZC.track.text = TZC:CreateFontString("Status", "LOW", "GameFontNormal")
TZC.track.text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
TZC.track.text:SetPoint("LEFT", TZC.track.icon, "RIGHT", 2, 0)
TZC.track.text:SetFontObject(GameFontWhite)
TZC.track.text:SetParent(TZC.track)

TZC:position()

local refreshTime

TZC.friendlies = {}
TZC.enemies = {}
TZC.tracked = {}

local qFaction
local pFaction
local eFaction

local queried
local queriedTime = GetTime()
local queriedTimeout = 1

local openFaction
local openFriends

local _PlaySound = PlaySound
local pass = function() end

function TZC:Tracking()
    if IsAddOnLoaded("HCRank") then
        if not TZC.tracking then
            TZC.tracking = HCRank_players()
        end
    else
        TZC.tracking = nil
    end
    if TZC.tracking and (TurtleZoneCount_Settings.track or UnitIsPVP("player")) then
        if TZC.tracking then
            TZC:SetHeight(107)
            TZC.track:Show()
        end
    else
        TZC:SetHeight(86)
        TZC.track:Hide()
    end
end

function TZC:setIcons(faction)
    -- Inv_bannerpvp_01 = Horde icon
    -- Inv_bannerpvp_02 = Alliance icon
    if faction == "Alliance" then
        eFaction = "Horde"
        TZC.efaction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_01")
        TZC.efaction.border:SetBackdropBorderColor(1,0.1,0.1)
        TZC.faction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_02")    
        TZC.faction.border:SetBackdropBorderColor(0,0.44,0.87)
    elseif faction == "Horde" then
        eFaction = "Alliance"        
        TZC.efaction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_02")
        TZC.efaction.border:SetBackdropBorderColor(0,0.44,0.87)
        TZC.faction.icon:SetTexture("Interface\\Icons\\Inv_bannerpvp_01")
        TZC.faction.border:SetBackdropBorderColor(1,0.1,0.1)
    end
end

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

function TZC:updateFriendlyText()
    local friendlies = TZC:getTotal(TZC.friendlies)
    friendlies = TZC:maxWho(friendlies)
    local color = TZC:color(qFaction)
    if friendlies == 0 then
        TZC.faction.text:SetText(color..friendlies)
    else
        local higher, lower = TZC:getLevels(TZC.friendlies)
        TZC.faction.text:SetText(color..friendlies.."|r |cffFF7D01"..higher.."|r/|cffFFFC01"..lower)
    end
end

function TZC:updateEnemyText()
    local enemies = TZC:getTotal(TZC.enemies)
    enemies = TZC:maxWho(enemies)
    local color = TZC:color(qFaction)
    if enemies == 0 then
        TZC.efaction.text:SetText(color..enemies)
    else
        local higher, lower = TZC:getLevels(TZC.enemies)
        TZC.efaction.text:SetText(color..enemies.."|r |cffFF7D01"..higher.."|r/|cffFFFC01"..lower)
    end
end

function TZC:updateFriendsText()
    local friends = TZC:getTotal(TZC.friends)
    friends = TZC:maxWho(friends)
    if friends == 0 then
        TZC.friend.text:SetText(friends)
    else
        local higher, lower = TZC:getLevels(TZC.friends)
        TZC.friend.text:SetText(friends.." |cffFF7D01"..higher.."|r/|cffFFFC01"..lower)
    end    
end

function TZC:updateTrackedText()
    local tracked = TZC:getTotal(TZC.tracked)
    tracked = TZC:maxWho(tracked) 
    if tracked == 0 then
        TZC.track.text:SetText("|cffFF2020"..tracked)
    else
        local higher, lower = TZC:getLevels(TZC.tracked)
        TZC.track.text:SetText("|cffFF2020"..tracked.."|r |cffFF7D01"..higher.."|r/|cffFFFC01"..lower)
    end
end

function TZC:sendWhoConditions()
    local frames = {
        AuctionFrame,
        Bankframe,
        BattlefieldFrame,
        CharacterFrame,
        DressUpFrame,
        FriendsFrame,
        GossipFrame,
        GuildRegistrarFrame,
        InspectFrame,
        LootFrame,
        MailFrame,
        MacroFrame,
        MerchantFrame,
        SpellBookFrame,
        TabardFrame,
        TaxiFrame,
        TradeFrame,
        QuestFrame,
        QuestLogFrame,
    }

    local visible

    for _, frame in pairs(frames) do
        if frame:IsVisible() then      
            visible = true
            break
        end
    end

    if visible then
        TZC:refreshTime()
        return false
    else
        TZC:refreshTime()
        return true
    end
end

local timer = CreateFrame("Frame")
timer:Hide()
timer:SetScript("OnUpdate", function()
    local elapsed = GetTime() - queriedTime
    elapsed = (floor(elapsed))
    elapsed = 30-elapsed
    -- TZC.title.refresh:SetText(elapsed)

    if (elapsed <= 0) then
        if not qFaction then qFaction = pFaction end
        if qFaction == pFaction then
            TZC:sendWho(pFaction)    
        else
            TZC:sendWho(eFaction)
        end
    end    
end)

function TZC:sendWho(faction)
    qFaction = faction
    local filter
    
    if faction == "Alliance" then
        filter = "z-"..TZC.zone.." r-Human r-Dwarf r-Gnome r-Elf"
    elseif faction == "Horde" then
        filter = "z-"..TZC.zone.." r-Orc r-Troll r-Goblin r-Tauren r-Undead"        
    end               
        
    if filter and TZC:sendWhoConditions() then        
        PlaySound = pass            
        queried = true
        queriedTime = GetTime()            
        SendWho(filter)
        -- DEFAULT_CHAT_FRAME:AddMessage("sendwho faction "..qFaction)
    end
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
    refreshTime = GetTime() + 31
end

function TZC:whoInfo()
    if qFaction == pFaction then
        TZC.friendlies = {}
        TZC.tracked = {}
    else
        TZC.enemies = {}
    end

    for i=0, GetNumWhoResults() do
        local name, _, level, _, class = GetWhoInfo(i)
        if name then
            if qFaction == pFaction then               
                table.insert(TZC.friendlies, {name = name, level = level, class = class})
            else                
                table.insert(TZC.enemies, {name = name, level = level, class = class})
            end
            if TZC.tracking and TZC.tracking[name] then table.insert(TZC.tracked, {name = name, level = level, class = class}) end
        end
    end

    if qFaction == pFaction then
        TZC:updateFriendlyText()
        qFaction = eFaction
    else
        TZC:updateEnemyText()
        qFaction = pFaction
    end

    TZC:updateFriends()
    TZC:updateFriendsText()
    TZC:updateTrackedText()
end

function TZC:updateFriends()
    TZC.friends = {}
	for i=0, GetNumFriends() do
		local name, level, class, area = GetFriendInfo(i)
		if (area == TZC.zone) then			
            table.insert(TZC.friends, {name = name, level = level, class = class})
		end
	end
end

function TZC:getTotal(table)
    local count = 0
	for _ in pairs(table) do
		count = count + 1
	end
	return count	
end

function TZC:getLevels(table)
    local player = UnitLevel("player") 
    local higher, lower = 0, 0
    for i, name in ipairs(table) do
        if name.level <= player then
            lower = lower + 1
        else
            higher = higher + 1
        end
    end
    return higher, lower
end

function TZC:getDistribution(table, low, high)
    -- returns number of players >= low and < high
    local players = 0
    for i, name in ipairs(table) do
        local level = name.level
        if (level >= low) and (level < high) or (low == high and level == low) then
            players = players + 1
        end
    end
    return players
end

function TZC:zonetext(input)
    local words = {}
    local start = 1
    local word_start, word_end = string.find(input, "%S+", start)
    while word_start do
        table.insert(words, string.sub(input, word_start, word_end))
        start = word_end + 1
        word_start, word_end = string.find(input, "%S+", start)
    end
    if words[1] == "The" then
        table.remove(words, 1)
    end
    local output = words[1]
    -- local length = 4
    -- if string.len(output) > length then
    --     output = string.sub(output, 1, length)
    -- end
    return output
end

function TZC:update()
    qFaction = pFaction
    local zone = TZC:zonetext(TZC.zone)
    if zone then
        TZC.title.text:SetText(zone)
    end
    timer:Show()
end

function TZC:tooltip(table, faction)
    if not table then return end
    if not GameTooltip:IsShown() then 
        GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)
    end
    local players = TZC:getTotal(table)
    local color = TZC:color(faction)
    GameTooltip:ClearLines()   
    GameTooltip:AddDoubleLine(color..faction, color..players)
    if TZC:getDistribution(table, 60,60) > 0 then GameTooltip:AddDoubleLine("60", TZC:getDistribution(table, 60,60), 1,1,1,1,1,1) end
    if TZC:getDistribution(table, 50,59) > 0 then GameTooltip:AddDoubleLine("50-59", TZC:getDistribution(table, 50,59), 1,1,1,1,1,1) end
    if TZC:getDistribution(table, 40,49) > 0 then GameTooltip:AddDoubleLine("40-49", TZC:getDistribution(table, 40,49), 1,1,1,1,1,1) end
    if TZC:getDistribution(table, 30,39) > 0 then GameTooltip:AddDoubleLine("30-39", TZC:getDistribution(table, 30,39), 1,1,1,1,1,1) end
    if TZC:getDistribution(table, 20,29) > 0 then GameTooltip:AddDoubleLine("20-29", TZC:getDistribution(table, 20,29), 1,1,1,1,1,1) end
    if TZC:getDistribution(table, 10,19) > 0 then GameTooltip:AddDoubleLine("10-19", TZC:getDistribution(table, 10,19), 1,1,1,1,1,1) end
    if TZC:getDistribution(table, 1,9) > 0 then GameTooltip:AddDoubleLine("1-9", TZC:getDistribution(table, 1,9), 1,1,1,1,1,1) end
    GameTooltip:Show()
end

function TZC:friendtooltip()
    if not TZC.friends then return end
    if not GameTooltip:IsShown() then 
        GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)
    end
    local friends = TZC:getTotal(TZC.friends)
    GameTooltip:ClearLines()
    GameTooltip:AddDoubleLine("Friends", friends)
    for i, friend in ipairs(TZC.friends) do
        local class = RAID_CLASS_COLORS[strupper(friend.class)] or { r = .5, g = .5, b = .5, a = 1 }
        GameTooltip:AddLine(friend.name.." ("..friend.level..")", class.r,class.g,class.b)
	end
    GameTooltip:Show()
end

function TZC:rgbToHex(r, g, b)
    return string.format("%02X%02X%02X", r * 255, g * 255, b * 255)
end

function TZC:trackedcolor(rank)
    -- https://colorkit.co/gradient-palette/ff0000-f7ef00/?steps=4
    local color = "ffffff"
    if rank >= 75 then
      color = "f7ef00"
    elseif rank >= 50 then
      color = "faa000"    
    elseif rank >= 25 then
      color = "fc5100"    
    elseif rank >= 1 then
      color = "ff0000"
    end
    return color
  end

function TZC:trackedtooltip()
    if not TurtleZoneCount_Settings.track then return end
    if not TZC.tracked then return end
    if not GameTooltip:IsShown() then 
        GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)
    end
    local tracked = TZC:getTotal(TZC.tracked)  
    GameTooltip:ClearLines()
    GameTooltip:AddDoubleLine("Tracked", tracked, 1,0.1,0.1,1,0.1,0.1)
    for i, player in ipairs(TZC.tracked) do
        local name = player.name
        local level = player.level
        local class = RAID_CLASS_COLORS[strupper(player.class)] or { r = .5, g = .5, b = .5 }
        local hex = TZC:rgbToHex(class.r, class.g, class.b)
        local kills = TZC.tracking[name]["Kills"]
        local rank = TZC.tracking[name]["Rank"]
        local color = TZC:trackedcolor(rank)
		GameTooltip:AddDoubleLine("|cff"..color.."#"..rank.." |cff"..hex..name.." ("..level..")", "Players Killed: "..kills)
	end
    GameTooltip:Show()
end

TZC.efaction.button:SetScript("OnClick", function()
    TZC.emouse = true
end)

TZC.efaction.button:SetScript("OnEnter", function()
    TZC.emouse = true
    TZC:tooltip(TZC.enemies, eFaction)
end)

TZC.efaction.button:SetScript("OnLeave", function()
    TZC.emouse = nil
    GameTooltip:Hide()
end)

TZC.faction.button:SetScript("OnClick", function()
    TZC.fmouse = true
end)

TZC.faction.button:SetScript("OnEnter", function()
    TZC.fmouse = true
    TZC:tooltip(TZC.friendlies, pFaction)
end)

TZC.faction.button:SetScript("OnLeave", function()
    TZC.fmouse = nil
    GameTooltip:Hide()
end)

TZC.friend.button:SetScript("OnClick", function()
    GameTooltip:Hide()
    TZC:openFriends()
    TZC:updateFriends()
    TZC:updateFriendsText()
    TZC:friendtooltip()
end)

TZC.friend.button:SetScript("OnEnter", function()
    TZC:friendtooltip()
end)

TZC.friend.button:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

TZC.track.button:SetScript("OnEnter", function()
    TZC:trackedtooltip()
end)

TZC.track.button:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

TZC.title:SetScript("OnEnter", function()
    if not GameTooltip:IsShown() then 
        GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)
    end
    GameTooltip:ClearLines()
    GameTooltip:AddLine(TZC.zone)
    GameTooltip:Show()
end)

TZC.title:SetScript("OnLeave", function()
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

function TZC:reset()
    TurtleZoneCount_Settings.track = false
    TZC:Tracking()
end

function TZC:mapUpdate()
    local zone = GetRealZoneText()
    if TZC.zone ~= zone then
        TZC.zone = zone
        if IsInInstance() then
            TZC:Hide()
        else            
            TZC:Show()
            TZC:update()
        end
    end
end

local function TZC_commands(msg, editbox)
    local function message(setting, name)
        local state = "off"
        if setting then state = "on" end
        DEFAULT_CHAT_FRAME:AddMessage("TurtleZoneCount: "..name.." is "..state, 1, 0.5, 0)
    end
    if msg == "track" then
        if TurtleZoneCount_Settings.track then
            TurtleZoneCount_Settings.track = false
        else
            TurtleZoneCount_Settings.track = true
        end
        message(TurtleZoneCount_Settings.track, "Tracking")
        TZC:Tracking()
    elseif msg == "reset" then
        TZC:reset()
        DEFAULT_CHAT_FRAME:AddMessage("TurtleZoneCount: Settings reset", 1, 0.5, 0)
    else
        DEFAULT_CHAT_FRAME:AddMessage("TurtleZoneCount usage:", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/tzc track - toggle tracking of HC player killers", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/tzc reset - reset settings", 1, 0.5, 0)  
    end
end

TZC:RegisterEvent("PLAYER_ENTERING_WORLD")
TZC:RegisterEvent("MINIMAP_ZONE_CHANGED")
TZC:RegisterEvent("WHO_LIST_UPDATE")
TZC:RegisterEvent("UNIT_FACTION", "player")

TZC:SetScript("OnEvent", function()
    if event == "PLAYER_ENTERING_WORLD" then
        if not this.loaded then
            this.loaded = true            
            pFaction = UnitFactionGroup("player")
            TZC:setIcons(pFaction)
            TZC:Tracking()
            refreshTime = GetTime() + 1      
            TZC:mapUpdate()            
            SLASH_TZC1 = "/tzc"
            SLASH_TZC2 = "/turtlezonecount"
            SlashCmdList["TZC"] = TZC_commands
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff98Turtle|rZoneCount Loaded! /turtlezonecount or /tzc")
            if not IsAddOnLoaded("HCRank") then
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff98Turtle|rZoneCount: Hardcore killer tracking requires the HCRank addon")
            end
        end 
    elseif event == "MINIMAP_ZONE_CHANGED" then
        TZC:mapUpdate()
    elseif event == "WHO_LIST_UPDATE" then
        if queried then
            queried = nil            
            TZC:whoInfo()
            HideUIPanel(FriendsFrame)
            PlaySound = _PlaySound
        end
    elseif event == "UNIT_FACTION" then
        TZC:Tracking()
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

            local elapsed = GetTime() - queriedTime
            if (elapsed < queriedTimeout) then
                if result then                
                    TZC:whoInfo()
                    queried = nil
                    PlaySound = _PlaySound                    
                end
                return
            else
                queried = nil
            end
        end     
    end
    HookChatFrame_OnEvent(event)
end