SMODS.ConsumableType {
    key = 'det_tarot',
    collection_rows = {7, 7, 7},
    primary_colour = G.C.CHIPS,
    secondary_colour = HEX('a3589d'),
    loc_txt = {
        collection = 'Deteriorated Tarots',
        name = 'Det. Tarot'
    },
    shop_rate = 0.4
}

SMODS.Consumable { -- The Fool?
    key = "detFool",
    set = "det_tarot",
    atlas = "detC",
    pos = {x = 0, y = 0},
    loc_vars = function(self, info_queue, card)
        -- This vanilla variable only checks for vanilla Tarots and Planets, you would have to keep track on your own for any custom consumables
        local fool_c = G.GAME.last_det_tarot_planet and G.P_CENTERS[G.GAME.last_det_tarot_planet] or nil
        local last_det_tarot_planet = fool_c and localize { type = 'name_text', key = fool_c.key, set = fool_c.set } or localize('k_none')
        local colour = (not fool_c or fool_c.name == 'c_mot_detFool') and G.C.RED or G.C.GREEN

        if not (not fool_c or fool_c.name == 'c_mot_detFool') then
            info_queue[#info_queue + 1] = fool_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_det_tarot_planet .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_det_tarot_planet }, main_end = main_end }
    end,
    use = function(self, card, area, copier)
        SMODS.add_card({key = G.GAME.last_det_tarot_planet})
    end,
    can_use = function(self, card)
        return G.consumeables.config.card_limit >= #G.consumeables.cards and G.GAME.last_det_tarot_planet and G.GAME.last_det_tarot_planet ~= "c_mot_detFool"
    end
}





SMODS.Consumable { -- Hanged Man?
    key = "detHanged",
    set = "det_tarot",
    atlas = "detC",
    config = { extra = { cards = 2} },
    pos = {x = 2, y = 1},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.cards}}
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    use = function(self, card, area, copier)
        local cards = {}
        G.E_MANAGER:add_event(Event({
            delay = 0.7,
            trigger = "after",
            func = function()
                for i = 1, card.ability.extra.cards do
                    local card = SMODS.add_card {set = "Base", area = G.hand}
                    cards[#cards + 1] = card
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
        end}))
    end
}

SMODS.Consumable { -- High Priestess?
    key = "detPriestess",
    set = "det_tarot",
    atlas = "detC",
    pos = {x = 2, y = 0},
    config = {extra = {satellites = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.satellites}}
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or (card.area == G.consumeables)
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.satellites, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({set = 'det_planet'})
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
}