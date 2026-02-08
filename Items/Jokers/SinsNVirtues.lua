SMODS.Joker:take_ownership(lusty_joker, {
    pools = {
        ['sinfulPool'] = true,
        ['sinfulPoolFull'] = true
    }
})

SMODS.Joker:take_ownership(gluttenous_joker, {
    pools = {
        ['sinfulPool'] = true,
        ['sinfulPoolFull'] = true
    }
})

SMODS.Joker:take_ownership(greedy_joker, {
    pools = {
        ['sinfulPool'] = true,
        ['sinfulPoolFull'] = true
    }
})

SMODS.Joker:take_ownership(wrathful_joker, {
    pools = {
        ['sinfulPool'] = true,
        ['sinfulPoolFull'] = true
    }
})

SMODS.Joker {
    key = "pridefulJokerJ",
    pools = {
        ["sinfulPool"] = true
    },
    atlas = "CommonJ",
    blueprint_compat = true,
    pos = { x = 2, y = 0 },
    config = { extra = {mult = 3 } },
    mot_credits = {
        idea = {
            "Aduckted",
            "Gudusername"
        },
        art = {
            "Aduckted"
        },
        code = {
            "Mothball"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_any_suit(context.other_card) or SMODS.has_no_suit(context.other_card) then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {mult = card.ability.extra.mult}
                end
            end
        end
    end

}

SMODS.Joker {
    key = "enviousJokerJ",
    pools = {
        ["sinfulPool"] = true
    },
    atlas = "CommonJ",
    blueprint_compat = true,
    pos = { x = 3, y = 0 },
    config = { extra = {multMax = 20} },
    mot_credits = {
        idea = {
            "Mothball"
        },
        art = {
            "Aduckted"
        },
        code = {
            "Mothball"
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.multMax } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local multTotal = card.ability.extra.multMax - to_number(G.GAME.dollars)
            if multTotal <= 0 then
                return { mult = 0 }
            end
            return { mult = multTotal }
        end
    end
}

SMODS.Joker {
    key = "slothfulJokerJ",
    pools = {
        ["sinfulPool"] = true
    },
    atlas = "CommonJ",
    blueprint_compat = true,
    pos = { x = 4, y = 0 },
    config = { extra = {mult = 3} },
    mot_credits = {
        idea = {
            "Jinx"
        },
        art = {
            "Aduckted"
        },
        code = {
            "Mothball"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {mult = card.ability.extra.mult}
            end
        end
    end,
}

SMODS.Joker {
    key = "brokenFaithJ",
    pools = {
        ["sinfulPoolFull"] = true
    },
    atlas = "PLH", -- Add to rare atlas
    pos = {x = 0, y = 0},
    config = {extra = {}},
    rarity = 3,
    cost = 8,
    calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss and context.main_eval then
            if #G.jokers.cards <= G.jokers.config.card_limit then
                SMODS.add_card{
                    set = "sinfulPool",
                }
            end
        end
    end
}

SMODS.Joker {
    key = "ringOfLimboJ",
    pools = {
        ['ringsOfHell'] = true,
        ['sinfulPoolFull'] = true
    },
    rarity = "mot_superb",
    cost = 10,
    config = {extra = {xMultIncrease = .5, xmult = 1}},
    atlas = "PLH",
    pos = {x = 3, y = 0},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xMultIncrease, card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.selling_card and context.card:is_in_pool("sinfulPool") and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xMultIncrease
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "ringOfLustJ",
    pools = {
        ['ringsOfHell'] = true,
        ['sinfulPoolFull'] = true
    },
    rarity = "mot_superb",
    cost = 10,
    config = {extra = {xmult = 1, xmultIncrease = .1}},
    atlas = "PLH",
    pos = {x = 3, y = 0},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmultIncrease, card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card.config.center.key == 'j_lusty_joker' and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultIncrease
            return{message = localize("k_mot_upgrade"), colour = G.C.MULT, message_card = card}
        end
        if context.joker_main then
            return{xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "ringOfGluttonyJ",
    pools = {
        ['ringsOfHell'] = true,
        ['sinfulPoolFull'] = true
    },
    rarity = "mot_superb",
    cost = 10,
    config = {extra = {xmult = 1, xmultIncrease = .1}},
    atlas = "PLH",
    pos = {x = 3, y = 0},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmultIncrease, card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card.config.center.key == 'j_gluttenous_joker' and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultIncrease
            return{message = localize("k_mot_upgrade"), colour = G.C.MULT, message_card = card}
        end
        if context.joker_main then
            return{xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "ringOfGreedJ",
    pools = {
        ['ringsOfHell'] = true,
        ['sinfulPoolFull'] = true
    },
    rarity = "mot_superb",
    cost = 10,
    config = {extra = {xmult = 1, xmultIncrease = .1}},
    atlas = "PLH",
    pos = {x = 3, y = 0},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmultIncrease, card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card.config.center.key == 'j_greedy_joker' and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultIncrease
            return{message = localize("k_mot_upgrade"), colour = G.C.MULT, message_card = card}
        end
        if context.joker_main then
            return{xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "ringOfWrathJ",
    pools = {
        ['ringsOfHell'] = true,
        ['sinfulPoolFull'] = true
    },
    rarity = "mot_superb",
    cost = 10,
    config = {extra = {xmult = 1, xmultIncrease = .1}},
    atlas = "PLH",
    pos = {x = 3, y = 0},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmultIncrease, card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card.config.center.key == 'j_wrathful_joker' and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultIncrease
            return{message = localize("k_mot_upgrade"), colour = G.C.MULT, message_card = card}
        end
        if context.joker_main then
            return{xmult = card.ability.extra.xmult}
        end
    end
}