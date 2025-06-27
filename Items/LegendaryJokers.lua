--[[
 * LegendaryJokers.lua
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
    key = "jinxJ",
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    rarity = 4,
    atlas = "LegendJ",
    config = {extra = {X_mult = 1, mult_mod = 1}},
    cost = 20,
    blueprint_compat = true,
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.X_mult, card.ability.extra.mult_mod}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {xmult = card.ability.extra.X_mult}
        end
        if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.X_mult = card.ability.extra.X_mult + card.ability.extra.mult_mod
            card.ability.extra.mult_mod = card.ability.extra.mult_mod + 1
        end
    end

}

SMODS.Joker {
    key = "altxxJ",
    pos = {x = 2, y = 0},
    soul_pos = {x = 3, y = 0},
    rarity = 4,
    atlas = "LegendJ",
    blueprint_compat = true,
    config = {extra = {repetitions = 2}},
    cost = 20,
    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.ancient_card or {}).suit or 'Spades'
        return {vars = {localize(suit, 'suits_singular'), colours = {G.C.SUITS[suit]}, repetitions = 2}}
    end,

    calculate = function (self, card, context)
        if context.repetition and context.other_card:is_suit(G.GAME.current_round.ancient_card.suit) and context.cardarea == G.play then
            return {repetitions = card.ability.extra.repetitions}
        end
    end

}

SMODS.Joker {
    key = "titanJ",
    pos = {x = 4, y = 0},
    soul_pos = {x = 5, y = 0},
    rarity = 4,
    atlas = "LegendJ",
    blueprint_compat = true,
    config = {extra = {X_mult = 2}},
    cost = 20,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.X_mult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.other_card:is_suit("Spades") and context.cardarea == G.play then
            return {xmult = card.ability.extra.X_mult}
        end
    end
}