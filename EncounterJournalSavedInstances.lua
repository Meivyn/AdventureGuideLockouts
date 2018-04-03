local L = {
	['Defeated'] = 'Defeated',
	['Available'] = 'Available',
	['Assault on Violet Hold'] = 'Assault on Violet Hold',
	['Coilfang: Serpentshrine Cavern'] = 'Coilfang: Serpentshrine Cavern',
	['Serpentshrine Cavern'] = 'Serpentshrine Cavern',
	['Tempest Keep'] = 'Tempest Keep',
	['The Eye'] = 'The Eye',
	['The Sunwell'] = 'The Sunwell',
	['Sunwell Plateau'] = 'Sunwell Plateau',
	['Pandaria'] = 'Pandaria',
	['Draenor'] = 'Draenor',
	['Broken Isles'] = 'Broken Isles',
	['Invasion Points'] = 'Invasion Points',
	['August Celestials'] = 'August Celestials',
	['World Bosses'] = 'World Bosses'
}

local locale = GetLocale()

if locale == 'frFR' then
	L = {
		['Defeated'] = 'Vaincu',
		['Available'] = 'Disponible',
		['Assault on Violet Hold'] = 'L’assaut sur le fort Pourpre',
		['Coilfang: Serpentshrine Cavern'] = 'Glissecroc : caverne du sanctuaire du Serpent',
		['Serpentshrine Cavern'] = 'Caverne du sanctuaire du Serpent',
		['Tempest Keep'] = 'Donjon de la Tempête',
		['The Eye'] = 'L’Œil',
		['The Sunwell'] = 'Le Puits de soleil',
		['Sunwell Plateau'] = 'Plateau du Puits de soleil',
		['Pandaria'] = 'Pandarie',
		['Draenor'] = 'Draenor',
		['Broken Isles'] = 'Îles Brisées',
		['Invasion Points'] = 'Sites d’invasion',
		['August Celestials'] = 'Astres vénérables',
		['World Bosses'] = 'Boss hors instance'
	}
end

local eventFrame = CreateFrame('Frame', 'EncounterJournalSavedInstances_EventFrame', UIParent)
eventFrame:Show()

local startTime = -1
local savedInstances = {}
local statusFrames = {}

local function UpdateSavedInstances()
	savedInstances = {}
	for i = 1, GetNumSavedInstances() do
		local instanceName, instanceID, instanceReset, instanceDifficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, difficultyName, maxBosses, defeatedBosses = GetSavedInstanceInfo(i)
		-- Fix for SSC
		if instanceName == L['Coilfang: Serpentshrine Cavern'] then
			savedInstances[L['Serpentshrine Cavern']] = {}
		-- Fix for Tempest Keep
		elseif instanceName == L['Tempest Keep'] then
			savedInstances[L['The Eye']] = {}
		-- Fix for Sunwell
		elseif instanceName == L['The Sunwell'] then
			savedInstances[L['Sunwell Plateau']] = {}
		elseif savedInstances[instanceName] == nil then
			savedInstances[instanceName] = {}
		end
		-- Worldbosses
		savedInstances[L['Pandaria']] = {}
		savedInstances[L['Draenor']] = {}
		savedInstances[L['Broken Isles']] = {}
		savedInstances[L['Invasion Points']] = {}

		local difficulty = 'normal'

		if instanceDifficulty == 7 or instanceDifficulty == 17 then
			difficulty = 'lfr'
		elseif instanceDifficulty == 2 or instanceDifficulty == 5 or instanceDifficulty == 6 or instanceDifficulty == 15 then
			difficulty = 'heroic'
		elseif instanceDifficulty == 16 or instanceDifficulty == 23 then
			difficulty = 'mythic'
		end

		local bosses = {}
		for b = 1, maxBosses do
			local bossName, texture, isKilled, unknown4 = GetSavedInstanceEncounterInfo(i, b)
			table.insert(bosses, {
				name = bossName,
				isKilled = isKilled
			})
		end

		-- Worldbosses
		local worldBosses_Pandaria = {}
		table.insert(worldBosses_Pandaria, {name = EJ_GetEncounterInfo(691), isKilled = IsQuestFlaggedCompleted(32099)})         -- Sha of Anger
		table.insert(worldBosses_Pandaria, {name = EJ_GetEncounterInfo(725), isKilled = IsQuestFlaggedCompleted(32098)})         -- Salyis's Warband
		table.insert(worldBosses_Pandaria, {name = EJ_GetEncounterInfo(814), isKilled = IsQuestFlaggedCompleted(32518)})         -- Nalak, The Storm Lord
		table.insert(worldBosses_Pandaria, {name = EJ_GetEncounterInfo(826), isKilled = IsQuestFlaggedCompleted(32519)})         -- Oondasta
		table.insert(worldBosses_Pandaria, {name = L['August Celestials'], isKilled = IsQuestFlaggedCompleted(33117)})           -- August Celestials
		table.insert(worldBosses_Pandaria, {name = EJ_GetEncounterInfo(861), isKilled = IsQuestFlaggedCompleted(33118)})         -- Ordos, Fire-God of the Yaungol

		local worldBosses_Draenor = {}
		table.insert(worldBosses_Draenor, {name = EJ_GetEncounterInfo(1291), isKilled = IsQuestFlaggedCompleted(37460)})         -- Drov the Ruiner
		table.insert(worldBosses_Draenor, {name = EJ_GetEncounterInfo(1211), isKilled = IsQuestFlaggedCompleted(37462)})         -- Tarlna the Ageless
		table.insert(worldBosses_Draenor, {name = EJ_GetEncounterInfo(1262), isKilled = IsQuestFlaggedCompleted(37464)})         -- Rukhmar
		table.insert(worldBosses_Draenor, {name = EJ_GetEncounterInfo(1452), isKilled = IsQuestFlaggedCompleted(39380)})         -- Supreme Lord Kazzak

		local worldBosses_BrokenIsles = {}
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1790), isKilled = IsQuestFlaggedCompleted(43512)})     -- Ana-Mouz
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1956), isKilled = IsQuestFlaggedCompleted(47061)})     -- Apocron
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1883), isKilled = IsQuestFlaggedCompleted(46947)})     -- Brutallus
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1774), isKilled = IsQuestFlaggedCompleted(43193)})     -- Calamir
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1789), isKilled = IsQuestFlaggedCompleted(43448)})     -- Drugon the Frostblood
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1795), isKilled = IsQuestFlaggedCompleted(43985)})     -- Flotsam
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1770), isKilled = IsQuestFlaggedCompleted(42819)})     -- Humongris
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1769), isKilled = IsQuestFlaggedCompleted(43192)})     -- Levantus
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1884), isKilled = IsQuestFlaggedCompleted(46948)})     -- Malificus
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1783), isKilled = IsQuestFlaggedCompleted(43513)})     -- Na'zak the Fiend
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1749), isKilled = IsQuestFlaggedCompleted(42270)})     -- Nithogg
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1763), isKilled = IsQuestFlaggedCompleted(42779)})     -- Shar'thos
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1885), isKilled = IsQuestFlaggedCompleted(46945)})     -- Si'vash
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1756), isKilled = IsQuestFlaggedCompleted(42269)})     -- The Soultakers
		table.insert(worldBosses_BrokenIsles, {name = EJ_GetEncounterInfo(1796), isKilled = IsQuestFlaggedCompleted(44287)})     -- Withered Jim

		local worldBosses_InvasionPoints = {}
		table.insert(worldBosses_InvasionPoints, {name = EJ_GetEncounterInfo(2010), isKilled = IsQuestFlaggedCompleted(49199)})  -- Matron Folnuna
		table.insert(worldBosses_InvasionPoints, {name = EJ_GetEncounterInfo(2011), isKilled = IsQuestFlaggedCompleted(48620)})  -- Mistress Alluradel
		table.insert(worldBosses_InvasionPoints, {name = EJ_GetEncounterInfo(2012), isKilled = IsQuestFlaggedCompleted(49198)})  -- Inquisitor Meto
		table.insert(worldBosses_InvasionPoints, {name = EJ_GetEncounterInfo(2013), isKilled = IsQuestFlaggedCompleted(49195)})  -- Occularus
		table.insert(worldBosses_InvasionPoints, {name = EJ_GetEncounterInfo(2014), isKilled = IsQuestFlaggedCompleted(49197)})  -- Sotanathor
		table.insert(worldBosses_InvasionPoints, {name = EJ_GetEncounterInfo(2015), isKilled = IsQuestFlaggedCompleted(49196)})  -- Pit Lord Vilemus

		-- Fix for Violet Hold
		if instanceName == L['Assault on Violet Hold'] then
			maxBosses = 3
		end

		-- Fix for SSC
		if locked and instanceName == L['Coilfang: Serpentshrine Cavern'] then
			table.insert(savedInstances[L['Serpentshrine Cavern']], {
				instanceID = instanceID,
				bosses = bosses,
				instanceName = instanceName,
				instanceDifficulty = instanceDifficulty,
				difficulty = difficulty,
				difficultyName = difficultyName,
				maxBosses = maxBosses,
				defeatedBosses = defeatedBosses,
				instanceReset = instanceReset,
				progress = defeatedBosses..'/'..maxBosses,
				complete = locked and defeatedBosses == maxBosses,
				locked = locked
			})
		-- Fix for Tempest Keep
		elseif locked and instanceName == L['Tempest Keep'] then
			table.insert(savedInstances[L['The Eye']], {
				instanceID = instanceID,
				bosses = bosses,
				instanceName = instanceName,
				instanceDifficulty = instanceDifficulty,
				difficulty = difficulty,
				difficultyName = difficultyName,
				maxBosses = maxBosses,
				defeatedBosses = defeatedBosses,
				instanceReset = instanceReset,
				progress = defeatedBosses..'/'..maxBosses,
				complete = locked and defeatedBosses == maxBosses,
				locked = locked
			})
		-- Fix for Sunwell
		elseif locked and instanceName == L['The Sunwell'] then
			table.insert(savedInstances[L['Sunwell Plateau']], {
				instanceID = instanceID,
				bosses = bosses,
				instanceName = instanceName,
				instanceDifficulty = instanceDifficulty,
				difficulty = difficulty,
				difficultyName = difficultyName,
				maxBosses = maxBosses,
				defeatedBosses = defeatedBosses,
				instanceReset = instanceReset,
				progress = defeatedBosses..'/'..maxBosses,
				complete = locked and defeatedBosses == maxBosses,
				locked = locked
			})
		elseif locked then
			table.insert(savedInstances[instanceName], {
				instanceID = instanceID,
				bosses = bosses,
				instanceName = instanceName,
				instanceDifficulty = instanceDifficulty,
				difficulty = difficulty,
				difficultyName = difficultyName,
				maxBosses = maxBosses,
				defeatedBosses = defeatedBosses,
				instanceReset = instanceReset,
				progress = defeatedBosses..'/'..maxBosses,
				complete = locked and defeatedBosses == maxBosses,
				locked = locked
			})
		-- Worldbosses
		else
			maxBosses = 6
			defeatedBosses = (IsQuestFlaggedCompleted(32099) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(32098) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(32518) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(32519) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(33117) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(33118) and 1 or 0)
			if defeatedBosses > 0 then
				table.insert(savedInstances[L['Pandaria']], {
					bosses = worldBosses_Pandaria,
					instanceName = L['Pandaria'],
					difficulty = 'normal',
					difficultyName = L['World Bosses'],
					maxBosses = maxBosses,
					defeatedBosses = defeatedBosses,
					progress = defeatedBosses..'/'..maxBosses,
					complete = defeatedBosses == maxBosses
				})
			end
			maxBosses = 4
			defeatedBosses = (IsQuestFlaggedCompleted(37460) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(37462) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(37464) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(39380) and 1 or 0)
			if defeatedBosses > 0 then
				table.insert(savedInstances[L['Draenor']], {
					bosses = worldBosses_Draenor,
					instanceName = L['Draenor'],
					difficulty = 'normal',
					difficultyName = L['World Bosses'],
					maxBosses = maxBosses,
					defeatedBosses = defeatedBosses,
					progress = defeatedBosses..'/'..maxBosses,
					complete = defeatedBosses == maxBosses
				})
			end
			maxBosses = 1
			defeatedBosses = (IsQuestFlaggedCompleted(43512) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(47061) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(46947) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(43193) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(43448) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(43985) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(42819) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(43192) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(46948) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(43513) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(42270) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(42779) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(46945) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(42269) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(44287) and 1 or 0)
			if defeatedBosses > 0 then
				table.insert(savedInstances[L['Broken Isles']], {
					bosses = worldBosses_BrokenIsles,
					instanceName = L['Broken Isles'],
					difficulty = 'normal',
					difficultyName = L['World Bosses'],
					maxBosses = maxBosses,
					defeatedBosses = defeatedBosses,
					progress = defeatedBosses..'/'..maxBosses,
					complete = defeatedBosses == maxBosses
				})
			end
			maxBosses = 1
			defeatedBosses = (IsQuestFlaggedCompleted(49199) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(48620) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(49198) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(49195) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(49197) and 1 or 0)
			defeatedBosses = defeatedBosses + (IsQuestFlaggedCompleted(49196) and 1 or 0)
			if defeatedBosses > 0 then
				table.insert(savedInstances[L['Invasion Points']], {
					bosses = worldBosses_InvasionPoints,
					instanceName = L['Invasion Points'],
					difficulty = 'normal',
					difficultyName = L['World Bosses'],
					maxBosses = maxBosses,
					defeatedBosses = defeatedBosses,
					progress = defeatedBosses..'/'..maxBosses,
					complete = defeatedBosses == maxBosses
				})
			end
		end
	end
end

local function UpdateStatusFramePosition(instanceFrame)
	local savedFrames = statusFrames[instanceFrame:GetName()]
	local lfrVisible = savedFrames and savedFrames['lfr'] and savedFrames['lfr']:IsShown()
	local normalVisible = savedFrames and savedFrames['normal'] and savedFrames['normal']:IsShown()
	local heroicVisible = savedFrames and savedFrames['heroic'] and savedFrames['heroic']:IsShown()
	local mythicVisible = savedFrames and savedFrames['mythic'] and savedFrames['mythic']:IsShown()

	if mythicVisible then
		savedFrames['mythic']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', 4, -12)
	end

	if heroicVisible then
		if mythicVisible then
			savedFrames['heroic']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', -28, -12)
		else
			savedFrames['heroic']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', 4, -12)
		end
	end

	if normalVisible then
		if heroicVisible and mythicVisible then
			savedFrames['normal']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', -60, -23)
		elseif heroicVisible or mythicVisible then
			savedFrames['normal']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', -28, -23)
		else
			savedFrames['normal']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', 4, -23)
		end
	end

	if lfrVisible then
		if normalVisible and heroicVisible and mythicVisible then
			savedFrames['lfr']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', -92, -23)
		elseif heroicVisible and mythicVisible or heroicVisible and normalVisible or mythicVisible and normalVisible then
			savedFrames['lfr']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', -60, -23)
		elseif normalVisible or heroicVisible or mythicVisible then
			savedFrames['lfr']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', -28, -23)
		else
			savedFrames['lfr']:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', 4, -23)
		end
	end
end

local function ShowTooltip(frame)
	local info = frame.instanceInfo

	GameTooltip:SetOwner(frame, 'ANCHOR_BOTTOMRIGHT')
	GameTooltip:SetText(info.instanceName .. ' (' .. info.difficultyName .. ')')

	if info.defeatedBosses > 0 then
		for i, boss in ipairs(info.bosses) do
			if boss.isKilled then
				GameTooltip:AddDoubleLine(boss.name, L['Defeated'], 1, 1, 1, 1, 0, 0)
			end
		end
	end

	if not info.complete then
		for i, boss in ipairs(info.bosses) do
			if not boss.isKilled then
				GameTooltip:AddDoubleLine(boss.name, L['Available'], 1, 1, 1, 0, 1, 0)
			end
		end
	end
	GameTooltip:Show()
end

local function hideTooltip(frame)
	GameTooltip:Hide()
end


local function CreateStatusFrame(instanceFrame, difficulty)
	local statusFrame = CreateFrame('Frame', nil, instanceFrame)
	statusFrame:Hide()

	statusFrame:SetScript('OnEnter', ShowTooltip)
	statusFrame:SetScript('OnLeave', hideTooltip)

	-- skull flag
	statusFrame.texture = statusFrame:CreateTexture(nil, 'ARTWORK')
	statusFrame.texture:SetPoint('TOPLEFT')
	statusFrame:SetSize(38, 46)
	statusFrame.texture:SetTexture('Interface\\Minimap\\UI-DungeonDifficulty-Button')
	statusFrame.texture:SetSize(38, 46)

	statusFrame:SetPoint('BOTTOMRIGHT', instanceFrame, 'BOTTOMRIGHT', 17, -12)

	if difficulty == 'mythic' then
		statusFrame.texture:SetTexCoord(0.30, 0.45, 0.0703125, 0.4296875)
	elseif difficulty == 'heroic' then
		statusFrame.texture:SetTexCoord(0.05, 0.20, 0.0703125, 0.4296875)
	else
		statusFrame.texture:SetTexCoord(0.05, 0.20, 0.5703125, 0.9296875)
	end

	-- green check mark
	local completeFrame = CreateFrame('Frame', nil, statusFrame)
	completeFrame:Hide()

	completeFrame.texture = completeFrame:CreateTexture(nil, 'ARTWORK', 'GreenCheckMarkTemplate')
	completeFrame:SetSize(16, 16)

	if difficulty == 'lfr' or difficulty == 'normal' then
		completeFrame:SetPoint('BOTTOM', statusFrame, 'BOTTOM', 0, 14)
	else
		completeFrame:SetPoint('BOTTOM', statusFrame, 'BOTTOM', 0, 3)
	end

	completeFrame.texture:ClearAllPoints()
	completeFrame.texture:SetPoint('TOPLEFT')
	completeFrame.texture:Show()

	-- progress
	local progressFrame = statusFrame:CreateFontString(nil, nil, 'GameFontNormalLeft')
	progressFrame:Hide()
	progressFrame:SetFont('Fonts\\ARIALN.TTF', 13)
	if difficulty == 'lfr' or difficulty == 'normal' then
		progressFrame:SetPoint('BOTTOM', statusFrame, 'BOTTOM', 0, 19)
	else
		progressFrame:SetPoint('BOTTOM', statusFrame, 'BOTTOM', 0, 8)
	end
	progressFrame:SetTextColor(1, 1, 1)

	statusFrame.completeFrame = completeFrame
	statusFrame.progressFrame = progressFrame

	if statusFrames[instanceFrame:GetName()] == nil then
		statusFrames[instanceFrame:GetName()] = {}
	end
	statusFrames[instanceFrame:GetName()][difficulty] = statusFrame

	return statusFrame
end

local function UpdateInstanceStatusFrame(instanceFrame)
	if statusFrames[instanceFrame:GetName()] then
		for difficulty, frame in pairs(statusFrames[instanceFrame:GetName()]) do
			frame:Hide()
		end
	end

	local instances = savedInstances[instanceFrame.tooltipTitle]
	if instances == nil then
		return
	end

	for key, instance in ipairs(instances) do
		local frame = (statusFrames[instanceFrame:GetName()] and statusFrames[instanceFrame:GetName()][instance.difficulty]) or CreateStatusFrame(instanceFrame, instance.difficulty)
		if instance.complete then
			frame.completeFrame:Show()
			frame.progressFrame:Hide()
			frame:Show()
		elseif instance.progress then
			frame.completeFrame:Hide()
			frame.progressFrame:SetText(instance.progress)
			frame.progressFrame:Show()
			frame:Show()
		else
			frame:Hide()
		end

		frame.instanceInfo = instance
	end
	UpdateStatusFramePosition(instanceFrame)
end

-------------------

eventFrame:RegisterEvent('PLAYER_LOGIN')
local function OnEvent(self, event, ...)
	if event == 'PLAYER_LOGIN' then
		startTime = GetTime()
	end
end
eventFrame:SetScript('OnEvent', OnEvent)

local function OnUpdate(self, elapsed)
	if startTime >= 0 and GetTime() - startTime > 2 and IsAddOnLoaded('Blizzard_EncounterJournal') then
		eventFrame:SetScript('OnUpdate', nil)
		startTime = nil

		-- UpdateSavedInstances()
		-- texplore(savedInstances)

		local function UpdateFrames()
			UpdateSavedInstances()
			local b1 = _G['EncounterJournalInstanceSelectScrollFrameScrollChildInstanceButton1']
			if b1 then
				UpdateInstanceStatusFrame(b1)
			end
			for i = 1, 100 do
				local b = _G['EncounterJournalInstanceSelectScrollFrameinstance'..i]
				if b then
					UpdateInstanceStatusFrame(b)
				end
			end
		end
		hooksecurefunc('EncounterJournal_ListInstances', UpdateFrames)
		EncounterJournal_ListInstances()
	end
end
eventFrame:SetScript('OnUpdate', OnUpdate)
