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
    mot_credits = {
        idea = {
            "Willow",
        },
        art = {
            "Willow",
        },
        code = {
            "Mothball",
        },
    },
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

-- Helper function to roll rarity with weighted chances
local function roll_rarity_weighted()
    -- Define rarity chances (higher numbers = more common)
    -- Rarity 1: 50%, Rarity 2: 25%, Rarity 3: 15%, Rarity 4: 7%, Rarity 5: 2.5%, Rarity 6: 0.5%
    local rarity_weights = {
        [1] = 500,  -- Common (50%)
        [2] = 250,  -- Uncommon (25%)
        [3] = 150,  -- Rare (15%)
        [4] = 25,   -- Legendary (7%)
        [5] = 70,   -- Superb (2.5%)
        [6] = 5     -- Omega (0.5%)
    }
    
    -- Calculate total weight
    local total_weight = 0
    for _, weight in pairs(rarity_weights) do
        total_weight = total_weight + weight
    end
    
    -- Roll random number using match seed
    local roll = pseudorandom('gacha_rarity_' .. G.GAME.pseudorandom.seed) * total_weight
    
    -- Find which rarity was rolled
    local current_weight = 0
    for rarity = 1, 6 do
        current_weight = current_weight + rarity_weights[rarity]
        if roll <= current_weight then
            return rarity
        end
    end
    
    return 1 -- Fallback to rarity 1
end


SMODS.Joker{
    key = "gachaJokerJ",
    pos = {x = 2, y = 0},
    rarity = "mot_omega",
    atlas = "OmegaJ",
    config = {extra = {rolls = 1, rollCap = 5, currentPity = 0, imutable = { cost = 10, rollIncrease = 5, maxRollCap = 25,  amountOfRolls = 0, pity = 20, }}},
    cost = 50,
    blueprint_compat = false,
    mot_credits = {
        idea = {
            "Vrinee",
        },
        art = {
            -- "GoldDog",
        },
        code = {
            "Vrinee",
            "Mothball", -- trying
            "Hoarfrost Trickle",
        },
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.imutable.cost, card.ability.extra.rolls, card.ability.extra.imutable.pity, card.ability.extra.currentPity, card.ability.extra.imutable.amountOfRolls, card.ability.extra.imutable.rollIncrease, card.ability.extra.rollCap }}
    end,

    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint then
            local remaining_slots = G.jokers.config.card_limit - #G.jokers.cards
            if to_big(G.GAME.dollars) < to_big(card.ability.extra.imutable.cost) then -- check if player has enough money
                return {
                    message = localize('k_not_enough_money'),
                    colour = G.C.MONEY
                }
            elseif remaining_slots <= 0 then
                return {
                    message = localize('k_not_enough_slots'),
                    colour = G.C.MONEY
                }
            end
            
            if card.ability.extra.rollCap >= card.ability.extra.imutable.maxRollCap then card.ability.extra.rollCap = card.ability.extra.imutable.maxRollCap end
            if card.ability.extra.rolls >= card.ability.extra.rollCap then card.ability.extra.rolls = card.ability.extra.rollCap end
            
            local rolls = math.min(card.ability.extra.rolls, math.min( remaining_slots, math.floor(to_number(G.GAME.dollars) / 10)))
            
            -- Perform the rolls
            for i = 1, rolls do
                -- Deduct money
                ease_dollars(-card.ability.extra.imutable.cost)
                local rolled_rarity = roll_rarity_weighted()
                -- Apply pity system for legendary+
                if card.ability.extra.currentPity >= card.ability.extra.imutable.pity and rolled_rarity < 4 then
                    rolled_rarity = math.max(4, rolled_rarity) -- Guarantee at least legendary
                    card.ability.extra.currentPity = 0 -- Reset pity
                elseif rolled_rarity >= 4 then
                    card.ability.extra.currentPity = 0 -- Reset pity on natural high roll
                end
                local rarityTable = { --table for rarity names
                    [1] = localize('k_common'),
                    [2] = localize('k_uncommon'),
                    [3] = localize('k_rare'),
                    [4] = localize('k_legendary'),
                    [5] = localize('k_mot_superb'),
                    [6] = localize('k_mot_omega'),
                    
                }
                local rarity_name = rarityTable[rolled_rarity]
                local rarity_for_card = rolled_rarity
                local legendary = nil

                -- Determine rarity for card creation
                if rolled_rarity == 1 then-- Common
                    rarity_for_card = 0
                elseif rolled_rarity == 2 then-- Uncommon
                    rarity_for_card = 0.8
                elseif rolled_rarity == 3 then-- Rare
                    rarity_for_card = 1
                elseif rolled_rarity == 4 then-- Legendary
                    legendary = true
                elseif rolled_rarity == 5 then-- Superb
                    rarity_for_card = "mot_superb"
                elseif rolled_rarity == 6 then-- Omega
                    rarity_for_card = "mot_omega"
                end
                
                -- Create joker using event system
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        local new_joker = create_card('Joker', G.jokers, legendary, rarity_for_card, nil, nil, nil, 'gacha')
                        new_joker:add_to_deck()
                        G.jokers:emplace(new_joker)
                        new_joker:start_materialize()
                        return true
                    end
                }))
                
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_rolled').." " .. rarity_name .. "!",
                    colour = G.C.FILTER
                })
            end
            
            -- Update pity counter and rolls
            card.ability.extra.imutable.amountOfRolls = card.ability.extra.imutable.amountOfRolls + rolls
            card.ability.extra.currentPity = card.ability.extra.currentPity + rolls
            
            -- Check if we need to increase the number of rolls
            while card.ability.extra.imutable.amountOfRolls >= card.ability.extra.imutable.rollIncrease do
                card.ability.extra.rolls = card.ability.extra.rolls + 1
                card.ability.extra.imutable.amountOfRolls = card.ability.extra.imutable.amountOfRolls - card.ability.extra.imutable.rollIncrease
            end 
            
            -- doing this again after to be safe
            if card.ability.extra.rollCap >= card.ability.extra.imutable.maxRollCap then card.ability.extra.rollCap = card.ability.extra.imutable.maxRollCap end
            if card.ability.extra.rolls >= card.ability.extra.rollCap then card.ability.extra.rolls = card.ability.extra.rollCap end

            -- Message to player
            return {
                message = localize("k_mot_gacha"),
                colour = G.C.MONEY
            }
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { ref_table = "card.ability.extra", ref_value = "rolls"},
                { text = " rolls"},
                { text = " (Max: ", colour = G.C.GREY },
                { ref_table = "card.ability.extra", ref_value = "rollCap" , colour = G.C.GREY },
                { text = ")", colour = G.C.GREY},
            },
            text_config = { colour = G.C.GREEN },
            reminder_text = {
                { text = "Pity: "},
                { ref_table = "card.ability.extra", ref_value = "currentPity"},
                { text = "/"},
                { ref_table = "card.ability.extra.imutable", ref_value = "pity"},
                -- { text = ")"},
            },
        }
    end
}

SMODS.Joker {
    key = "zygornJ", -- (sic)
    unlocked = true,
    blueprint_compat = true,
    rarity = "mot_omega",
    atlas = "PLH",
    cost = 50,
    pos = { x = 4, y = 0 },
    config = { extra = {emult = 1, emult_gain = 0.2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.emult_gain, card.ability.extra.emult } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            for _, removed_card in ipairs(context.removed) do
                if ModofTheseus.debuffed(removed_card)  then
                    card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emult_gain
                    SMODS.calculate_effect({message = localize('k_upgrade_ex')}, card)
                end
            end
        end
        if context.selling_card and not context.blueprint then
            if ModofTheseus.debuffed(context.card) then
                card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emult_gain
                SMODS.calculate_effect({message = "upgraded"}, card)
            end
        end
        if context.joker_main then
            return { emult = card.ability.extra.emult }
        end
    end

  -- todo: add joker display compatibility @chore  

} 