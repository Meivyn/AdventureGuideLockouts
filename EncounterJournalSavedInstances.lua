local locale = GetLocale()

local L = {
	['Defeated'] = 'Defeated',
	['Available'] = 'Available',
	['Assault on Violet Hold'] = 'Assault on Violet Hold',
	['Ahn\'Qiraj Temple'] = 'Ahn\'Qiraj Temple',
	['Coilfang: Serpentshrine Cavern'] = 'Coilfang: Serpentshrine Cavern',
	['Tempest Keep'] = 'Tempest Keep',
	['The Sunwell'] = 'The Sunwell',
	['August Celestials'] = 'August Celestials',
	['World Bosses'] = 'World Bosses'
}

if locale == 'frFR' then
	L = {
		['Defeated'] = 'Vaincu',
		['Available'] = 'Disponible',
		['Assault on Violet Hold'] = 'L’assaut sur le fort Pourpre',
		['Coilfang: Serpentshrine Cavern'] = 'Glissecroc : caverne du sanctuaire du Serpent',
		['Tempest Keep'] = 'Donjon de la Tempête',
		['Black Temple'] = 'Temple noir',
		['The Sunwell'] = 'Le Puits de soleil',
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

	local pandaria = EJ_GetInstanceInfo(322)
	local draenor = EJ_GetInstanceInfo(557)
	local brokenIsles = EJ_GetInstanceInfo(822)
	local invasionPoints = EJ_GetInstanceInfo(959)
	local azeroth = EJ_GetInstanceInfo(1028)

	local difficulty = 'normal'

	local fEid
	local fQid
	if UnitFactionGroup("player") == "Horde" then
		fEid = 2212 fQid = 52848								-- The Lion's Roar
	else
		fEid = 2213 fQid = 52847								-- Doom's Howl
	end
	local worldBossesData = {
		Pandaria = {
			instanceName = pandaria,
			maxBosses = 6,
			bosses = {
				{encounter = 691, quest = 32099},				-- Sha of Anger
				{encounter = 725, quest = 32098},				-- Salyis's Warband
				{encounter = 814, quest = 32518},				-- Nalak, The Storm Lord
				{encounter = 826, quest = 32519},				-- Oondasta
				{name = L['August Celestials'], quest = 33117},	-- August Celestials
				{encounter = 861, quest = 33118}				-- Ordos, Fire-God of the Yaungol
			}
		},
		Draenor = {
			instanceName = draenor,
			maxBosses = 3,
			bosses = {
				{encounter = 1291, quest = 37460},				-- Drov the Ruiner
				{encounter = 1211, quest = 37462},				-- Tarlna the Ageless
				{encounter = 1262, quest = 37464},				-- Rukhmar
				{encounter = 1452, quest = 39380}				-- Supreme Lord Kazzak
			}
		},
		BrokenIsles = {
			instanceName = brokenIsles,
			maxBosses = 1,
			bosses = {
				{encounter = 1790, quest = 43512},				-- Ana-Mouz
				{encounter = 1956, quest = 47061},				-- Apocron
				{encounter = 1883, quest = 46947},				-- Brutallus
				{encounter = 1774, quest = 43193},				-- Calamir
				{encounter = 1789, quest = 43448},				-- Drugon the Frostblood
				{encounter = 1795, quest = 43985},				-- Flotsam
				{encounter = 1770, quest = 42819},				-- Humongris
				{encounter = 1769, quest = 43192},				-- Levantus
				{encounter = 1884, quest = 46948},				-- Malificus
				{encounter = 1783, quest = 43513},				-- Na'zak the Fiend
				{encounter = 1749, quest = 42270},				-- Nithogg
				{encounter = 1763, quest = 42779},				-- Shar'thos
				{encounter = 1885, quest = 46945},				-- Si'vash
				{encounter = 1756, quest = 42269},				-- The Soultakers
				{encounter = 1796, quest = 44287}				-- Withered Jim
			}
		},
		InvasionPoints = {
			instanceName = invasionPoints,
			maxBosses = 1,
			bosses = {
				{encounter = 2010, quest = 49199},				-- Matron Folnuna
				{encounter = 2011, quest = 48620},				-- Mistress Alluradel
				{encounter = 2012, quest = 49198},				-- Inquisitor Meto
				{encounter = 2013, quest = 49195},				-- Occularus
				{encounter = 2014, quest = 49197},				-- Sotanathor
				{encounter = 2015, quest = 49196}				-- Pit Lord Vilemus
			}
		},
		Azeroth = {
			instanceName = azeroth,
			maxBosses = 1,
			bosses = {
				{encounter = 2139, quest = 52181},				-- T'zane
				{encounter = 2141, quest = 52169},				-- Ji'arak
				{encounter = 2197, quest = 52157},				-- Hailstone Construct
				{encounter = fEid, quest = fQid},				-- The Lion's Roar/Doom's Howl
				-- {encounter = 2199, quest = 0},				-- Azurethos, The Winged Typhoon
				{encounter = 2198, quest = 52166},				-- Warbringer Yenajz
				{encounter = 2210, quest = 52196}				-- Dunegorger Kraulok
			}
		}
	}

	for z, wb in pairs(worldBossesData) do
		for n = 1, #wb.bosses do
			if IsQuestFlaggedCompleted(wb.bosses[n].quest) then
				savedInstances[wb.instanceName] = savedInstances[wb.instanceName] or {}
			end
		end
	end

	local worldBosses = {}
	for z, wb in pairs(worldBossesData) do
		worldBosses[z] = worldBosses[z] or {}
		for n = 1, #wb.bosses do
			if not wb.bosses[n].name then
				wb.bosses[n].name = EJ_GetEncounterInfo(wb.bosses[n].encounter)
			end
			table.insert(worldBosses[z], {
				name = wb.bosses[n].name,
				isKilled = IsQuestFlaggedCompleted(wb.bosses[n].quest)
			})
		end
	end

	local defeatedBosses = 0
	for z, wb in pairs(worldBosses) do
		for n = 1, #wb do
			if wb[n].isKilled then
				defeatedBosses = defeatedBosses + 1
			end
			if worldBossesData[z].instanceName and savedInstances[worldBossesData[z].instanceName] then
				local maxBosses = worldBossesData[z].maxBosses
				if defeatedBosses > 0 then
					table.insert(savedInstances[worldBossesData[z].instanceName], {
						bosses = worldBosses[z],
						instanceName = worldBossesData[z].instanceName,
						difficulty = difficulty,
						difficultyName = L['World Bosses'],
						maxBosses = worldBossesData[z].maxBosses,
						defeatedBosses = defeatedBosses,
						progress = defeatedBosses..'/'..maxBosses,
						complete = defeatedBosses == maxBosses
					})
				end
			end
		end
	end
	for i = 1, GetNumSavedInstances() do
		local instanceName, _, _, instanceDifficulty, locked, _, _, _, _, difficultyName, maxBosses, defeatedBosses = GetSavedInstanceInfo(i)
		-- Fix for AQ40 english clients
		if instanceName == L['Ahn\'Qiraj Temple'] then
			instanceName = EJ_GetInstanceInfo(744)
			-- Fix for SSC
		elseif instanceName == L['Coilfang: Serpentshrine Cavern'] then
			instanceName = EJ_GetInstanceInfo(748)
			-- Fix for Tempest Keep
		elseif instanceName == L['Tempest Keep'] then
			instanceName = EJ_GetInstanceInfo(749)
			-- Fix for Black Temple french clients
		elseif instanceName == L['Black Temple'] then
			instanceName = EJ_GetInstanceInfo(751)
			-- Fix for Sunwell
		elseif instanceName == L['The Sunwell'] then
			instanceName = EJ_GetInstanceInfo(752)
			-- Fix for Violet Hold
		elseif instanceName == L['Assault on Violet Hold'] then
			maxBosses = 3
		end
		savedInstances[instanceName] = savedInstances[instanceName] or {}

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
			local bossName, _, isKilled = GetSavedInstanceEncounterInfo(i, b)
			table.insert(bosses, {
				name = bossName,
				isKilled = isKilled
			})
		end

		if locked then
			table.insert(savedInstances[instanceName], {
				bosses = bosses,
				instanceName = instanceName,
				instanceDifficulty = instanceDifficulty,
				difficulty = difficulty,
				difficultyName = difficultyName,
				maxBosses = maxBosses,
				defeatedBosses = defeatedBosses,
				progress = defeatedBosses..'/'..maxBosses,
				complete = locked and defeatedBosses == maxBosses,
				locked = locked
			})
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

	for i, boss in ipairs(info.bosses) do
		if boss.isKilled then
			GameTooltip:AddDoubleLine(boss.name, L['Defeated'], 1, 1, 1, 1, 0, 0)
		elseif not info.complete and not boss.isKilled then
			GameTooltip:AddDoubleLine(boss.name, L['Available'], 1, 1, 1, 0, 1, 0)
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
