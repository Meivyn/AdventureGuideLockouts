local ADDON_NAME, AddOn = ...

AddOn.worldBosses = {
    {
        instanceID = 322,                            -- Pandaria
        encounters = {
            { encounterID = 691, questID = 32099 },  -- Sha of Anger
            { encounterID = 725, questID = 32098 },  -- Salyis's Warband
            { encounterID = 814, questID = 32518 },  -- Nalak, The Storm Lord
            { encounterID = 826, questID = 32519 },  -- Oondasta
            { encounterID = nil, questID = 33117 },  -- The Four Celestials
            { encounterID = 861, questID = 33118 }   -- Ordos, Fire-God of the Yaungol
        }
    },
    {
        instanceID = 557,                            -- Draenor
        encounters = {
            { encounterID = 1291, questID = 37460 }, -- Drov the Ruiner
            { encounterID = 1211, questID = 37462 }, -- Tarlna the Ageless
            { encounterID = 1262, questID = 37464 }, -- Rukhmar
            { encounterID = 1452, questID = 39380 }  -- Supreme Lord Kazzak
        }
    },
    {
        instanceID = 822,                            -- Broken Isles
        encounters = {
            { encounterID = 1790, questID = 43512 }, -- Ana-Mouz
            { encounterID = 1956, questID = 47061 }, -- Apocron
            { encounterID = 1883, questID = 46947 }, -- Brutallus
            { encounterID = 1774, questID = 43193 }, -- Calamir
            { encounterID = 1789, questID = 43448 }, -- Drugon the Frostblood
            { encounterID = 1795, questID = 43985 }, -- Flotsam
            { encounterID = 1770, questID = 42819 }, -- Humongris
            { encounterID = 1769, questID = 43192 }, -- Levantus
            { encounterID = 1884, questID = 46948 }, -- Malificus
            { encounterID = 1783, questID = 43513 }, -- Na'zak the Fiend
            { encounterID = 1749, questID = 42270 }, -- Nithogg
            { encounterID = 1763, questID = 42779 }, -- Shar'thos
            { encounterID = 1885, questID = 46945 }, -- Si'vash
            { encounterID = 1756, questID = 42269 }, -- The Soultakers
            { encounterID = 1796, questID = 44287 }  -- Withered Jim
        }
    },
    {
        instanceID = 959,                            -- Invasion Points
        encounters = {
            { encounterID = 2010, questID = 49199 }, -- Matron Folnuna
            { encounterID = 2011, questID = 48620 }, -- Mistress Alluradel
            { encounterID = 2012, questID = 49198 }, -- Inquisitor Meto
            { encounterID = 2013, questID = 49195 }, -- Occularus
            { encounterID = 2014, questID = 49197 }, -- Sotanathor
            { encounterID = 2015, questID = 49196 }  -- Pit Lord Vilemus
        }
    },
    {
        instanceID = 1028,                           -- Azeroth
        encounters = {
            { encounterID = 2139, questID = 52181 }, -- T'zane
            { encounterID = 2141, questID = 52169 }, -- Ji'arak
            { encounterID = 2197, questID = 52157 }, -- Hailstone Construct
            { encounterID = nil , questID = nil   }, -- The Lion's Roar/Doom's Howl
            { encounterID = 2199, questID = 52163 }, -- Azurethos, The Winged Typhoon
            { encounterID = 2198, questID = 52166 }, -- Warbringer Yenajz
            { encounterID = 2210, questID = 52196 }, -- Dunegorger Kraulok
            { encounterID = nil , questID = nil   }, -- Ivus the Forest Lord/Ivus the Decayed
            { encounterID = 2362, questID = 56057 }, -- Ulmath, the Soulbinder
            { encounterID = 2363, questID = 56056 }, -- Wekemara
            { encounterID = 2381, questID = 55466 }, -- Vuk'laz the Earthbreaker
            { encounterID = 2378, questID = 58705 }  -- Grand Empress Shek'zara
        }
    },
    {
        instanceID = 1192,                           -- Shadowlands
        encounters = {
            { encounterID = 2430, questID = 61813 }, -- Valinor, the Light of Eons
            { encounterID = 2431, questID = 61816 }, -- Mortanis
            { encounterID = 2432, questID = 61815 }, -- Oranomonos the Everbranching
            { encounterID = 2433, questID = 61814 }, -- Nurgash Muckformed
            { encounterID = 2456, questID = 64531 }, -- Mor'geth, Tormentor of the Damned
            { encounterID = 2468, questID = 65143 }  -- Antros
        }
    },
    {
        -- TODO: Will show up on Blackrock Foundry.
        instanceID = 1205,                           -- Dragon Isles
        encounters = {
            { encounterID = 2515, questID = 69929 }, -- Strunraan, The Sky's Misery
            { encounterID = 2506, questID = 69930 }, -- Basrikron, The Shale Wing
            { encounterID = 2517, questID = 69927 }, -- Bazual, The Dreaded Flame
            { encounterID = 2518, questID = 69928 }, -- Liskanoth, The Futurebane
            { encounterID = 2531, questID = 74892 }, -- The Zaqali Elders
            { encounterID = 2562, questID = 76367 }  -- Aurostor, The Hibernator
        }
    },
    {
        instanceID = 1278,                           -- Khaz Algar
        encounters = {
            { encounterID = 2625, questID = 81624 }, -- Orta, the Broken Mountain
            { encounterID = 2635, questID = 82653 }, -- Aggregation of Horrors
            { encounterID = 2636, questID = 81653 }, -- Shurrai, Atrocity of the Undersea
            { encounterID = 2637, questID = 81630 }, -- Kordac, the Dormant Protector
            { encounterID = 2683, questID = 85088 }, -- The Gobfather
            { encounterID = 2762, questID = 87354 }  -- Reshanor, The Untethered
        }
    },
    {
        instanceID = 1312,                           -- Midnight
        encounters = {
            { encounterID = 2827, questID = 92560 }, -- Lu'ashal
            { encounterID = 2782, questID = 92123 }, -- Cragpine
            { encounterID = 2828, questID = 92636 }, -- Predaxas
            { encounterID = 2829, questID = 92034 }  -- Thorm'belan
        }
    }
}

function AddOn:RequestWarfrontInfo()
    local stromgardeState = C_ContributionCollector.GetState(self.playerFaction == "Horde" and 116 or 11)
    local darkshoreState = C_ContributionCollector.GetState(self.playerFaction == "Horde" and 117 or 118)
    self.isStromgardeAvailable = stromgardeState == Enum.ContributionState.Building or stromgardeState == Enum.ContributionState.Active
    self.isDarkshoreAvailable = darkshoreState == Enum.ContributionState.Building or darkshoreState == Enum.ContributionState.Active
end

---@param instanceIndex number
---@return string, number, string, number, number, number @ instanceName, instanceID, difficultyName, numEncounters, numCompleted, difficulty
function AddOn:GetSavedWorldBossInfo(instanceIndex)
    local instance = self.worldBosses[instanceIndex]
    local instanceID = instance.instanceID
    local instanceName = EJ_GetInstanceInfo(instanceID)
    local difficulty = 2
    local difficultyName = RAID_INFO_WORLD_BOSS
    local numEncounters = #instance.encounters
    local numCompleted = 0

    for encounterIndex = 1, numEncounters do
        local encounter = instance.encounters[encounterIndex]
        local isDefeated = C_QuestLog.IsQuestFlaggedCompleted(encounter.questID)
        if instanceIndex == 5 then
            if encounterIndex == 4 then
                isDefeated = isDefeated and self.isStromgardeAvailable
            elseif encounterIndex == 8 then
                isDefeated = isDefeated and self.isDarkshoreAvailable
            end
        end
        if isDefeated then
            numCompleted = numCompleted + 1
        end
    end

    return instanceName, instanceID, difficultyName, numEncounters, numCompleted, difficulty
end

---@param instanceIndex number
---@param encounterIndex number
---@return string, boolean @ bossName, isKilled
function AddOn:GetSavedWorldBossEncounterInfo(instanceIndex, encounterIndex)
    local encounter = self.worldBosses[instanceIndex].encounters[encounterIndex]
    local bossName
    local isKilled = C_QuestLog.IsQuestFlaggedCompleted(encounter.questID)
    if not encounter.encounterID then
        bossName = select(2, GetAchievementInfo(7333)) -- Localize "The Four Celestials"
    else
        bossName = EJ_GetEncounterInfo(encounter.encounterID)
    end
    return bossName, isKilled
end

---@param instanceIndex number
---@return table @ instanceLockout
function AddOn:GetInstanceLockout(instanceIndex)
    local instanceName, _, _, instanceDifficulty, locked, extended, _, _, _, difficultyName, numEncounters, numCompleted, _, instanceID = GetSavedInstanceInfo(instanceIndex)
    if not locked and not extended then
        return
    end

    local encounters = {}
    for encounterIndex = 1, numEncounters do
        local bossName, _, isKilled = GetSavedInstanceEncounterInfo(instanceIndex, encounterIndex)
        encounters[encounterIndex] = {
            bossName = bossName,
            isKilled = isKilled
        }
    end

    local _, _, isHeroic, _, displayHeroic, displayMythic, _, isLFR = GetDifficultyInfo(instanceDifficulty)
    local difficulty = 2
    if displayMythic then
        difficulty = 4
    elseif isHeroic or displayHeroic then
        difficulty = 3
    elseif isLFR then
        difficulty = 1
    end

    if instanceID == 1544 then
        numEncounters = 3 -- Fixes wrong encounters count for Assault on Violet Hold
    elseif instanceID == 1822 then
        numEncounters = 4 -- Fixes https://github.com/Meivyn/AdventureGuideLockouts/issues/1
    end

    return {
        encounters = encounters,
        instanceName = instanceName,
        instanceID = instanceID,
        difficulty = difficulty,
        difficultyName = difficultyName,
        numEncounters = numEncounters,
        numCompleted = numCompleted,
        progress = numCompleted .. "/" .. numEncounters,
        complete = numCompleted == numEncounters
    }
end

---@param bossName string
---@return boolean
local function IsInvasionBossActive(bossName)
    local zones = C_Map.GetMapChildrenInfo(905, Enum.UIMapType.Zone)
    for zoneIndex = 1, #zones do
        local mapID = zones[zoneIndex].mapID
        local poiIDs = C_AreaPoiInfo.GetAreaPOIForMap(mapID)
        for poiIndex = 1, #poiIDs do
            local poi = C_AreaPoiInfo.GetAreaPOIInfo(mapID, poiIDs[poiIndex])
            if poi.atlasName == "poi-rift2" and string.find(string.lower(poi.description), bossName, 1, true) then
                return true
            end
        end
    end
    return false
end

---@param instanceIndex number
---@return table @ instanceLockout
function AddOn:GetWorldBossLockout(instanceIndex)
    local instanceName, instanceID, difficultyName, numEncounters, numCompleted, difficulty = self:GetSavedWorldBossInfo(instanceIndex)
    local encounters = {}
    local numAvailableEncounters = 0

    local foundActiveInvasionBoss = false
    for encounterIndex = 1, numEncounters do
        local bossName, isKilled = self:GetSavedWorldBossEncounterInfo(instanceIndex, encounterIndex)
        local isAvailable = false

        if instanceIndex <= 2 then
            isAvailable = true
        elseif instanceIndex == 4 and not foundActiveInvasionBoss then
            isAvailable = IsInvasionBossActive(string.lower(bossName))
        else
            isAvailable = C_TaskQuest.IsActive(self.worldBosses[instanceIndex].encounters[encounterIndex].questID)
            if instanceIndex == 5 then
                if encounterIndex == 4 then
                    isAvailable = self.isStromgardeAvailable
                    isKilled = isKilled and isAvailable
                elseif encounterIndex == 8 then
                    isAvailable = self.isDarkshoreAvailable
                    isKilled = isKilled and isAvailable
                end
            end
        end

        encounters[encounterIndex] = {
            bossName = bossName,
            isKilled = isKilled,
            isAvailable = isAvailable
        }

        if isAvailable or isKilled then
            numAvailableEncounters = numAvailableEncounters + 1
        end
    end

    return {
        encounters = encounters,
        instanceName = instanceName,
        instanceID = instanceID,
        difficulty = difficulty,
        difficultyName = difficultyName,
        numEncounters = numAvailableEncounters,
        numCompleted = numCompleted,
        progress = numCompleted .. "/" .. numAvailableEncounters,
        complete = numCompleted == numAvailableEncounters
    }
end

function AddOn:UpdateSavedInstances()
    self.instanceLockouts = self.instanceLockouts and wipe(self.instanceLockouts) or {}
    local savedInstances = GetNumSavedInstances()
    for instanceIndex = 1, savedInstances + #self.worldBosses do
        local lockout
        if instanceIndex <= savedInstances then
            lockout = self:GetInstanceLockout(instanceIndex)
        else
            lockout = self:GetWorldBossLockout(instanceIndex - savedInstances)
        end
        if lockout then
            self.instanceLockouts[lockout.instanceID] = self.instanceLockouts[lockout.instanceID] or {}
            tinsert(self.instanceLockouts[lockout.instanceID], lockout)
        end
    end
end

local function ShowTooltip(frame)
    GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
    GameTooltip:SetText(frame.instanceInfo.instanceName .. " (" .. frame.instanceInfo.difficultyName .. ")")
    for i = 1, #frame.instanceInfo.encounters do
        local encounter = frame.instanceInfo.encounters[i]
        local r, g, b
        local bossStatus
        if encounter.isKilled then
            r, g, b = RED_FONT_COLOR:GetRGB()
            bossStatus = BOSS_DEAD
        elseif encounter.isAvailable == false or frame.instanceInfo.complete then
            r, g, b = GRAY_FONT_COLOR:GetRGB()
            bossStatus = QUEUE_TIME_UNAVAILABLE
        else
            r, g, b = GREEN_FONT_COLOR:GetRGB()
            bossStatus = BOSS_ALIVE
        end
        -- Fixes https://github.com/Meivyn/AdventureGuideLockouts/issues/1
        if frame.instanceInfo.instanceID ~= 1822 or i ~= 1 and i ~= 2 or encounter.isKilled then
            GameTooltip:AddDoubleLine(encounter.bossName, bossStatus, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, r, g, b)
        end
    end
    GameTooltip:Show()
end

local function HideTooltip()
    GameTooltip:Hide()
end

---@param button Button
---@param orderIndex number
---@param difficulty number
---@return Frame @ statusFrame
function AddOn:CreateStatusFrame(button, orderIndex, difficulty)
    local statusFrame = CreateFrame("Frame", nil, button)
    statusFrame:SetSize(38, 46)
    statusFrame:SetScript("OnEnter", ShowTooltip)
    statusFrame:SetScript("OnLeave", HideTooltip)

    statusFrame.texture = statusFrame:CreateTexture(nil, "ARTWORK")
    statusFrame.texture:SetPoint("CENTER")
    statusFrame.texture:SetTexture("Interface\\Minimap\\UI-DungeonDifficulty-Button")
    statusFrame.texture:SetSize(64, 46)

    if difficulty == 4 then
        statusFrame.texture:SetTexCoord(0.25, 0.5, 0.0703125, 0.4296875)
    elseif difficulty == 3 then
        statusFrame.texture:SetTexCoord(0, 0.25, 0.0703125, 0.4296875)
    else
        statusFrame.texture:SetTexCoord(0, 0.25, 0.5703125, 0.9296875)
    end

    local completeFrame = CreateFrame("Frame", nil, statusFrame)
    completeFrame:SetSize(16, 16)

    completeFrame.texture = completeFrame:CreateTexture(nil, "ARTWORK", "GreenCheckMarkTemplate")
    completeFrame.texture:ClearAllPoints()
    completeFrame.texture:SetPoint("CENTER")

    local progressFrame = statusFrame:CreateFontString(nil, nil, "GameFontNormalSmallLeft")

    if difficulty == 1 or difficulty == 2 then
        completeFrame:SetPoint("CENTER", 0, -1)
        progressFrame:SetPoint("CENTER", 0, 5)
    else
        completeFrame:SetPoint("CENTER", 0, -12)
        progressFrame:SetPoint("CENTER", 0, -9)
    end

    statusFrame.completeFrame = completeFrame
    statusFrame.progressFrame = progressFrame

    self.statusFrames[orderIndex] = self.statusFrames[orderIndex] or {}
    self.statusFrames[orderIndex][difficulty] = statusFrame

    return statusFrame
end

---@param orderIndex number
function AddOn:UpdateStatusFramePosition(orderIndex)
    local numVisible = 0
    for difficulty = 4, 1, -1 do
        local statusFrame = self.statusFrames[orderIndex][difficulty]
        if statusFrame and statusFrame:IsVisible() then
            statusFrame:SetPoint("BOTTOMRIGHT", 4 + numVisible * -32, difficulty > 2 and -12 or -23)
            numVisible = numVisible + 1
        end
    end
end

---@param button Button
---@param elementData table
function AddOn:UpdateInstanceStatusFrame(button, elementData)
    self.statusFrames = self.statusFrames or {}
    local orderIndex = button:GetOrderIndex()
    local instances = self.instanceLockouts and (self.instanceLockouts[elementData.mapID] or self.instanceLockouts[elementData.instanceID])

    if self.statusFrames[orderIndex] then
        for _, frame in pairs(self.statusFrames[orderIndex]) do
            frame:Hide()
        end
    end

    if not instances then
        return
    end

    for i = 1, #instances do
        local instance = instances[i]
        local frame = self.statusFrames[orderIndex] and self.statusFrames[orderIndex][instance.difficulty] or self:CreateStatusFrame(button, orderIndex, instance.difficulty)
        if instance.complete then
            frame.completeFrame:Show()
            frame.progressFrame:Hide()
        elseif instance.progress then
            frame.completeFrame:Hide()
            frame.progressFrame:SetText(instance.progress)
            frame.progressFrame:Show()
        end
        frame.instanceInfo = instance
        frame:Show()
    end

    self:UpdateStatusFramePosition(orderIndex)
end

local function UpdateFrames()
    EncounterJournal.instanceSelect.ScrollBox:ForEachFrame(function(frame, elementData)
        AddOn:UpdateInstanceStatusFrame(frame, elementData)
    end)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("BOSS_KILL")
frame:RegisterEvent("UPDATE_INSTANCE_INFO")
frame:SetScript("OnEvent", function(_, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == ADDON_NAME then
            local playerFaction = UnitFactionGroup("player")
            AddOn.worldBosses[5].encounters[4].encounterID = playerFaction == "Horde" and 2212 or 2213
            AddOn.worldBosses[5].encounters[4].questID =  playerFaction == "Horde" and 52848 or 52847
            AddOn.worldBosses[5].encounters[8].encounterID = playerFaction == "Horde" and 2329 or 2345
            AddOn.worldBosses[5].encounters[8].questID =  playerFaction == "Horde" and 54896 or 54895
            AddOn.playerFaction = playerFaction
        elseif arg1 == "Blizzard_EncounterJournal" then
            hooksecurefunc("EncounterJournal_ListInstances", UpdateFrames)
        end
    elseif event == "BOSS_KILL" then
        RequestRaidInfo()
    elseif event == "UPDATE_INSTANCE_INFO" then
        AddOn:RequestWarfrontInfo()
        AddOn:UpdateSavedInstances()
    end
end)
