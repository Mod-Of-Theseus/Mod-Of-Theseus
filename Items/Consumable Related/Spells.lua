SMODS.ConsumableType{
    key = "spellCard",
    primary_colour = HEX("dec671"),
    secondary_colour = HEX("dec671"),
    collection_rows = {7, 7, 7},
    shop_rate = .1,
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
        pseudoshuffle(tempHand, 0) -- Remember to fix the seed later
        for i = 1, card.ability.extra.destroyCount do destroyedCards[#destroyedCards + 1] = tempHand [i] end
        SMODS.destroy_cards(destroyedCards)
    end
}

SMODS.Consumable{
    key = "forceSpl",
    config = {extra = {blindReduction = .33333}}, -- Set for accuracy, maybe not necessary with rounding?
    loc_vars = function(self, info_queue, card)
        return {vars = {(round_number(card.ability.extra.blindReduction * 100, 1))}}
    end,
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    can_use = function(self, card)
        return G.GAME.facing_blind -- Might change so that you can't be over 66% of the way there
    end,
    use = function(self, card, area, copier)
        ease_chips(round_number(G.GAME.blind.chips * card.ability.extra.blindReduction, 1))
    end
}