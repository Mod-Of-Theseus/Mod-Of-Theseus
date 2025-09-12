SMODS.ConsumableType{
    key = "spellCard",
    primary_colour = HEX("dec671"),
    secondary_colour = HEX("dec671"),
    collection_rows = {7, 7, 7},
    shop_rate = .5,
    loc_txt = {
        collection = "Spell Cards",
        name = "Spells"
    }
}

SMODS.Consumable{
    key = "fireballSpl",
    config = {extra = {destroyCount = 3}},
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.destroyCount}}
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    use = function(self, card, area, copier) -- This is literally just code taken from Immolate, if it breaks then blame VRemade
        local destroyedCards = {}
        local tempHand = {}
        for _, playing_card in ipairs(G.hand.cards) do tempHand[#tempHand + 1] = playing_card end
        table.sort(tempHand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )
        pseudoshuffle(tempHand, pseudoseed(158, 'smollusty')) -- Remember to fix the seed later
        for i = 1, card.ability.extra.destroyCount do destroyedCards[#destroyedCards + 1] = tempHand[i] end
        SMODS.destroy_cards(destroyedCards)
    end
}

SMODS.Consumable{
    key = "ritualSpl",
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    can_use = function(self, card)
        return #G.consumeables.cards <= G.consumeables.config.card_limit
    end,
    use = function(self, card, area, copier)
        SMODS.add_card({set = "Spectral"})
        if #G.consumeables.cards < G.consumeables.config.card_limit then
            SMODS.add_card({set = "spellCard"})
        end
    end
}

SMODS.Consumable{
    key = "immortalitySpl",
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    config = {extra = {select_limit = 1}},
    can_use = function(self, card)
        if #G.jokers.highlighted == card.ability.extra.select_limit then
            local valid = true
            for _,joker in pairs(G.jokers.highlighted) do
                valid = valid and (joker.ability.eternal or (joker.config.center.eternal_compat and not joker.ability.perishable))
            end
            return valid
        end
        return false
    end,

    use = function(self, card, area, copier)
        for _,joker in pairs(G.jokers.highlighted) do
            if not joker.ability.eternal then
                joker:set_eternal(true)
            end
        end
    end
}

SMODS.Consumable{
    key = "mageHandSpl",
    set = "spellCard",
    atlas = "PLH",
    config = {extra = {handIncrease = 1}},
    pos = {x = 1, y = 2},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.handIncrease}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.hand:change_size(card.ability.extra.handIncrease)
    end
}

SMODS.Consumable{
    key = "pocketDimensionSpl",
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    config = {extra = {slots = 1}},
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.consumeables:change_size(card.ability.extra.slots)
    end
}

SMODS.Consumable{
    key = "darknessSpl",
    set = "spellCard",
    atlas = "PLH",
    hidden = true,
    pos = {x = 1, y = 2},
    can_use = function(self, card)
        if #G.jokers.highlighted >= 1 then
            local joker = G.jokers.highlighted[1]
            if not joker.edition then 
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        local joker = G.jokers.highlighted[1]
        if not joker.edition then
            joker:set_edition('e_negative', true)
            joker.ability.rental = true
        end
    end
}

SMODS.Consumable{
    key = "polymorphSpl",
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    can_use = function(self, card)
        if #G.hand.highlighted == 2 then return true end
    end,
    use = function(self, card, area, copier)
        local card1 = G.hand.highlighted[1]
        local card2 = G.hand.highlighted[2]
        local card1Stats = {}
        local card2Stats = {}

        -- Create a list of everything card 1 has
        card1Stats[1] = card1.config.center
        card1Stats[2] = card1.seal
        card1Stats[3] = card1.edition

        -- Create a list of everything card 2 has
        card2Stats[1] = card2.config.center
        card2Stats[2] = card2.seal
        card2Stats[3] = card2.edition

        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = .1,
                func = function()
                    G.hand.highlighted[i]:flip()
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = .2,
            func = function()
                -- Set card 1 to have card 2's stuff
                if card2Stats[1] then card1:set_ability(card2Stats[1].key) elseif not card2Stats[1] then card1:set_ability(nil) end
                if card2Stats[2] then card1:set_seal(card2Stats[2]) elseif not card2Stats[2] then card1:set_seal(nil) end
                if card2Stats[3] then card1:set_edition(card2Stats[3].key) elseif not card2Stats[3] then card1:set_edition(nil) end
                card1:juice_up(.3, .5)

                -- Set card 2 to have card 1's stuff
                if card1Stats[1] then card2:set_ability(card1Stats[1].key) elseif not card1Stats[1] then card2:set_ability(nil) end
                if card1Stats[2] then card2:set_seal(card1Stats[2]) elseif not card1Stats[2] then card2:set_seal(nil) end
                if card1Stats[3] then card2:set_edition(card1Stats[3].key) elseif not card1Stats[3] then card2:set_edition(nil) end
                card2:juice_up(.3, .5)
                return true
            end
        }))

        -- Flip them back
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = .4,
                func = function()
                    G.hand.highlighted[i]:flip()
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable{
    key = "creationSpl",
    set = "spellCard",
    atlas = "PLH",
    hidden = true,
    pos = {x = 1, y = 2},
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        change_shop_size(1)
    end
}