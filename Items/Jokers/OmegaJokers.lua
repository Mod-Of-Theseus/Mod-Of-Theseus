--[[
 * OmegaJokers.lua
 * This file is part of Mod of Theseus
 *
 * Copyright (C) 2025 Mod of Theseus
 *
 * Mod of Theseus is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Mod of Theseus is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Mod of Theseus; if not, see <https://www.gnu.org/licenses/>.
]]

SMODS.Joker {
    key = "blobbyJ",
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    rarity = "mot_omega",
    atlas = "OmegaJ",
    config = {},
    cost = 50,
    blueprint_compat = true,
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return {vars = {}}
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, "m_steel") then
                -- this is apparently supposed to be 0.5-3 so i will change it to be that
                return {emult = (pseudorandom("mot_blobbyj")*2.5)+0.5}
            end
        end
    end
    -- No relevant info for joker display
}