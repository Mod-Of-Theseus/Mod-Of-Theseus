SMODS.Consumable {
    key = "bermuda",
    set = "Spectral",
    atlas = "PLH",
    hidden = true,
    pos = {x = 2, y = 2},
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit
    end,
    use = function(self, card, area, copier)
        SMODS.add_card{
            set = "Joker",
            rarity = "mot_omega"
        }

        if G.GAME.dollars ~= -20 then
            ease_dollars(-(G.GAME.dollars + 20), true)
        end
    end,
    mot_credits = {
        idea = {
            "Cooked Fish"
        },
        art = {
            "Willow" -- ?
        },
        code = {
            "Mothball"
        }
    }
}

SMODS.Consumable {
    key = "sinful",
    set = "Spectral",
    atlas = "PLH",
    pos = {x = 2, y = 2} ,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit
    end,

    mot_credits = {
        idea = {
            "Mothball",
        },
        art = {
        },
        code = {
            "Mothball",
        },
    },

    use = function(self, card, area, copier)
        SMODS.add_card{
            set = "sinfulPool"
        }
    end
}