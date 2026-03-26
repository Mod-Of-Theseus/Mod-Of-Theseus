SMODS.Joker {
    key = "bismuthEggJ",
    pos = {x = 0, y = 0},
    -- soul_pos = {x = 1, y = 0},
    rarity = "mot_bismuth",
    atlas = "PLH",
    config = { extra = { scalar = { 
        chips = 1,
        mult = 1,
        xmult = 0.01,
        emult = 0.01,
    } }},
    cost = 50,
    blueprint_compat = true,
    mot_credits = {
        idea = {
            "Hoarfrost Trickle",
        },
        art = {
            -- "Hoarfrost Trickle",
        },
        code = {
            "Hoarfrost Trickle",
        },
    },
    loc_vars = function (self, info_queue, card)
        return {vars = {
            ModofTheseus.get_meta("bismuth_egg_chips_upgrades") * card.ability.extra.scalar.chips,
            ModofTheseus.get_meta("bismuth_egg_mult_upgrades") * card.ability.extra.scalar.mult,
            ModofTheseus.get_meta("bismuth_egg_xmult_upgrades") * card.ability.extra.scalar.xmult + 1,
            ModofTheseus.get_meta("bismuth_egg_emult_upgrades") * card.ability.extra.scalar.emult + 1,
        }}
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                chips = ModofTheseus.get_meta("bismuth_egg_chips_upgrades") * card.ability.extra.scalar.chips,
                mult = ModofTheseus.get_meta("bismuth_egg_mult_upgrades") * card.ability.extra.scalar.mult,
                xmult = ModofTheseus.get_meta("bismuth_egg_xmult_upgrades") * card.ability.extra.scalar.xmult + 1,
                emult = ModofTheseus.get_meta("bismuth_egg_emult_upgrades") * card.ability.extra.scalar.emult + 1,
            }
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            local result = ModofTheseus.weighted_random("bismuth_egg",{
                chips = 14/24,
                mult = 8/24,
                xmult = 2/24,
                emult = 0.01/24,
            })
            local nb_bismuth_egg = 0
            for index, joker in pairs(G.jokers.cards) do
                if joker.config.center.key == "j_mot_bismuthEggJ" then
                    nb_bismuth_egg = nb_bismuth_egg + 1
                end
            end
            if result == "chips" then
                ModofTheseus.set_meta("bismuth_egg_chips_upgrades", ModofTheseus.get_meta("bismuth_egg_chips_upgrades") + 1)
                return { message = "+1 Chips"}
            elseif result == "mult" then
                ModofTheseus.set_meta("bismuth_egg_mult_upgrades", ModofTheseus.get_meta("bismuth_egg_mult_upgrades") + 1)
                return { message = "+1 Mult"}
            elseif result == "xmult" then
                ModofTheseus.set_meta("bismuth_egg_xmult_upgrades", ModofTheseus.get_meta("bismuth_egg_xmult_upgrades") + 1)
                return { message = "+1 xMult"}
            elseif result == "emult" then
                ModofTheseus.set_meta("bismuth_egg_emult_upgrades", ModofTheseus.get_meta("bismuth_egg_emult_upgrades") + 1)
                return { message = "+1 eMult"}
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+", colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
                { text = " +", colour = G.C.MULT },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
                { text = " " },
                {
                    border_nodes = {
                        { text = "X", },
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                },
                { text = " " },
                {
                    border_nodes = {
                        { text = "^", },
                        { ref_table = "card.joker_display_values", ref_value = "emult", retrigger_type = "exp" }
                    }
                },
            },
            calc_function = function(card)
                card.joker_display_values.chips = ModofTheseus.get_meta("bismuth_egg_chips_upgrades") * card.ability.extra.scalar.chips
                card.joker_display_values.mult = ModofTheseus.get_meta("bismuth_egg_mult_upgrades") * card.ability.extra.scalar.mult
                card.joker_display_values.xmult = ModofTheseus.get_meta("bismuth_egg_xmult_upgrades") * card.ability.extra.scalar.xmult + 1
                card.joker_display_values.emult = ModofTheseus.get_meta("bismuth_egg_emult_upgrades") * card.ability.extra.scalar.emult + 1
            end
        }
    end,
}