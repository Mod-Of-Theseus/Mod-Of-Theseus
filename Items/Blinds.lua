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

SMODS.Blind {
    key = "slash",
    discovered = true,
    boss = {min = 2},
    boss_colour = HEX("FF0883"),
    after_scoring = function(self)
        print('hello?')
        SMODS.destroy_cards(G.play.cards)
    end,
}

SMODS.Blind {
    key = "knight",
    atlas = "Blinds",
    pos = {y = 2},
    discovered = true,
    boss = {min = 4},
    boss_colour = HEX("111111"),
    loc_vars = function(self)
        return {
            vars = {
                G.GAME.current_round.most_played_poker_hand,
            },
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                "(most played hand)",
            },
        }
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        return not G.GAME.blind.disabled and handname ~= G.GAME.current_round.most_played_poker_hand
    end,
    get_loc_debuff_text = function(self)
        return "Must play your most played poker hand, bitch."
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

--[ taken from https://github.com/Eremel/Ortalab/blob/9c86be4365dbeb663ae0d3c6a20e70df0804e199/objects/blinds.lua#L1140
local draw_discard = G.FUNCS.draw_from_play_to_discard
G.FUNCS.draw_from_play_to_discard = function(e)
    local obj = G.GAME.blind.config.blind
    if obj.after_scoring and not G.GAME.blind.disabled then
        obj:after_scoring()
    end
    draw_discard(e)
end
