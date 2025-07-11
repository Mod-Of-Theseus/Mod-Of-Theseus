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
    config = {extra = {destroyCards = 3}},
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    can_use = function(self, card)
        return G.hand and #G.hand.cards >= card.ability.extra.destroyCards
    end,
    use = function(self, card, area, copier)
        local destroyedCards = {}
        local tempHand = {}
        for _, playing_card in ipairs(G.hand.cards) do tempHand[#tempHand + 1] = playing_card end
        table.sort(tempHand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )
        pseudoshuffle(tempHand, 0)
        for i = 1, card.ability.extra.destroyCards do destroyedCards[#destroyedCards + 1] = tempHand [i] end
        SMODS.destroy_cards(destroyedCards)
    end
}

SMODS.Consumable{
    key = "forceSpl",
    config = {extra = {blindReduction = .33333}},
    loc_vars = function(self, info_queue, card)
        return {vars = {(round_number(card.ability.extra.blindReduction * 100, 1))}}
    end,
    set = "spellCard",
    atlas = "PLH",
    pos = {x = 1, y = 2},
    can_use = function(self, card)
        return G.GAME.facing_blind
    end,
    use = function(self, card, area, copier)
        ease_chips(round_number(G.GAME.blind.chips * card.ability.extra.blindReduction, 1))
    end
}