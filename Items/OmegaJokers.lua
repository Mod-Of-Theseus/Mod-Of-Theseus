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
        return {vars = {}}
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, "m_steel") then
                return {emult = tonumber(string.format("%.2f", (math.random() + .5) + math.random(0, 2)))}
            end
        end
    end
}
SMODS.Joker {
    key = "fireiceJ",
    pos = {x = 2, y = 0},
    rarity = "mot_omega",
    atlas = "OmegaJ",
    config = {extra = {e_mult = 1, e_multGain1 = 1, e_multGain2 = 0.25, e_multGainDet = 0.25}},
    cost = 50,
    blueprint_compat = false,
    mot_credits = {
        idea = {
            "FireIce",
        },
        art = {
             "FireIce",
             "Gud Username"
        },
        code = {
            "FireIce",
        },
    },
    loc_vars = function(self, info_queue, card)
      return {vars = {card.ability.extra.e_mult, card.ability.extra.e_multGain1, card.ability.extra.e_multGain2, card.ability.extra.e_multGainDet}}
    end,
    calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "Spectral" then
        card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_multGain1
    end
  if context.using_consumeable and context.consumeable.ability.set == "Planet" then
        card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_multGain2
    end
  if context.using_consumeable and context.consumeable.ability.set == "Tarot" then
        card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_multGain2
    end
  if context.using_consumeable and context.consumeable.ability.set == "det_spectral" then
        card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_multGain1 + card.ability.extra.e_multGainDet
    end
  if context.using_consumeable and context.consumeable.ability.set == "det_planet" then
        card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_multGain2 + card.ability.extra.e_multGainDet
    end
  if context.using_consumeable and context.consumeable.ability.set == "det_tarot" then
        card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_multGain2 + card.ability.extra.e_multGainDet
    end
 if context.joker_main then
  return {
    e_mult = card.ability.extra.e_mult
 }
  end
end
}
