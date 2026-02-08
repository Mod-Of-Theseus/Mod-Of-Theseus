SMODS.Blind { -- by sephdotwav, art by inspectnerd
    key = 'angel',
    atlas = 'Blinds',
    pos = {y = 1},
    discovered = true,
    boss = {min = 1},
    boss_colour = HEX('c3e1ed'),
    recalc_debuff = function(self, card, from_blind)
        return card.area ~= G.jokers and not G.GAME.blind.disabled
    end,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        for k, v in ipairs(cards) do
            v:set_debuff(false)
        end
        return mult, hand_chips, false
    end,
}

SMODS.Blind { -- by sephdotwav, art by inspectnerd
    key = "demon",
    atlas = "Blinds",
    pos = {y = 0},
    discovered = true,
    boss = {min = 3},
    boss_colour = HEX("a1261d"),
    loc_vars = function(self)
        return {
            vars = {
                G.GAME.probabilities.normal,
            },
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                1,
            },
        }
    end,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        for k, v in ipairs(cards) do
            if not G.GAME.blind.disabled and (pseudorandom(pseudoseed("demon")) < (G.GAME.probabilities.normal / 3)) then
                v:set_debuff(true)
            end
        end
        return mult, hand_chips, false
    end,
}

SMODS.Blind { -- By GoldDog, art by GoldDog
    key = "black_print",
    atlas = "Blinds",
    pos = {y = 2},
    discovered = true,
    mult = 2,
    boss = {showdown = true},
    boss_colour = HEX("1c53a8"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled and (card.config.center.key == "j_blueprint" or card.config.center.key == "j_brainstorm") then
            return true
        end
    end,
}

SMODS.Blind { -- by sephdotwav, art by inspectnerd
    key = "lapis_loupe",
    atlas = "BlindsFinisher",
    pos = {y = 0},
    discovered = true,
    mult = 5,
    boss = {showdown = true},
    boss_colour = HEX("1c53a8"),
    set_blind = function(self)
        self.hands_sub = G.GAME.round_resets.hands - 1
        ease_hands_played(-self.hands_sub)
        ease_discard(#G.deck.cards-1)
    end,
    disable = function(self)
        ease_hands_played(self.hands_sub)
    end,
    press_play = function(self)
        ease_discard(-G.GAME.current_round.discards_left)
    end
}