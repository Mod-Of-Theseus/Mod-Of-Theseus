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