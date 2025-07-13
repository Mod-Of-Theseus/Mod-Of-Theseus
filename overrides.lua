

local SMODS_create_mod_badges = SMODS.create_mod_badges
---@diagnostic disable-next-line: duplicate-set-field
function SMODS.create_mod_badges(card, badges)
	SMODS_create_mod_badges(card, badges)

    local id = card and card.mod and card.mod.id
    if not id == "Mod_of_Theseus" then return end
	if not card or not card.mot_credits then return end


	local dynatext = nil

	if type(card.mot_credits) == "table" then
		-- Alphabetical order
		local categories = {}
		for category, _ in pairs(card.mot_credits) do
			table.insert(categories, category)
		end
		table.sort(categories)
		local credits = {}
		for _, category in ipairs(categories) do
			local credit_table = card.mot_credits[category]
			table.sort(credit_table)
			for _, name in ipairs(credit_table) do
				table.insert(credits, titlecase(category) .. ": " .. name)
			end
		end


		table.insert(credits, 1, "Theseus")
		dynatext = DynaText({
			string = credits,
			colours = {HEX("0062ff")},
			silent = true,
			scale = 0.33 * 0.9,
			float = true,
			shadow = true,
			offset_y = -0.05,
		})

	elseif type(card.mot_credits) == "function" then
		-- Allow using a function to allow for non-standard credits if needed
		dynatext = card.mot_credits()
	end


	local badge = create_dynatext_badge(dynatext, HEX("96bfff"))

	local function check_colors_equal(x, y)
		for i = 1, 4 do
			if x[i] ~= y[i] then
				return false
			end
		end
		return true
	end
	for i = 1, #badges do
		if check_colors_equal(badges[i].nodes[1].config.colour, HEX("96bfff")) then
			badges[i].nodes[1].nodes[2].config.object:remove()
			badges[i] = badge
			break
		end
	end

end

