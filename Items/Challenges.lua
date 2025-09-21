-- Sample: https://github.com/Dragokillfist/Example-Balatro-Mod/blob/main/Items/Challenges.lua

SMODS.Challenge({
    key = "gachaC",
    button_colour = HEX("97572b"),
    rules = {
        custom = { { id = "no_shop_jokers" } },
        modifiers = {},
    },
    jokers = {
        {id = 'j_mot_gachaJokerJ', edition = 'negative', eternal = true},
    },
    restrictions = {
        banned_cards = {
            { id = "c_judgement" },
            { id = "c_wraith" },
            { id = "c_soul" },
            { id = "j_riff_raff" },
            { id = "c_mot_bermuda" },
            { id = "c_mot_sinful" },
            {
                id = "p_buffoon_normal_1",
                ids = {
                    "p_buffoon_normal_1",
                    "p_buffoon_normal_2",
                    "p_buffoon_jumbo_1",
                    "p_buffoon_mega_1",
                },
            },
        },
        banned_tags = {
            { id = "tag_rare" },
            { id = "tag_uncommon" },
            { id = "tag_holo" },
            { id = "tag_polychrome" },
            { id = "tag_negative" },
            { id = "tag_foil" },
            { id = "tag_buffoon" },
            { id = "tag_top_up" },
        },
    }
})

--[[
SMODS.Challenge({
    key = "deadEndC",
    rules = {
        custom = {},
        modifiers = {
            {dollars = 10}
        }
    },

    jokers = {
        {id = "j_mot_officeJobJ", edition = "negative", eternal = true}
    }
})
]]