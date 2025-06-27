--[[
 * RareJokers.lua
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
    key = "winningbigJ",
    atlas = "RareJ",
    rarity = 3,
    pos = {x = 0, y = 0},
    config = {extra = {dollars = 1, money_mod = 1}},
    cost = 10,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars, card.ability.extra.money_mod}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.money_mod
            return {
                messsage = localize('k_upgrade_ex'),
                colour = G.C.MONEY
            }
        end
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}