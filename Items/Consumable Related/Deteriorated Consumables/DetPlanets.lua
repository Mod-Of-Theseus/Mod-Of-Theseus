SMODS.ConsumableType {
    key = 'det_planet',
    collection_rows = {7, 7, 7},
    primary_colour = G.C.CHIPS,
    secondary_colour = HEX('0067c6'),
    loc_txt = {
        collection = 'Deteriorated Planets',
        name = 'Det. Planet'
    },
    shop_rate = .5
}

SMODS.Consumable {
    key = "newHorizons_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 0, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "High Card", deteriorated = "Pluto"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "messenger_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 1, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Pair", deteriorated = "Mercury"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "jamesWebb_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 2, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Two Pair", deteriorated = "Uranus"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "venera_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 3, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Three of a Kind", deteriorated = "Venus"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "cassini_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 4, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Straight", deteriorated = "Saturn"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "juno_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 5, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Flush", deteriorated = "Jupiter"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "iss_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 6, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Full House", deteriorated = "Earth"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "odyssey_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 7, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Four of a Kind", deteriorated = "Mars"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "gps_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 8, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Straight Flush", deteriorated = "Neptune"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "voyager_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 9, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Five of a Kind", deteriorated = "Planet X"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "dawn_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 10, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Flush House", deteriorated = "Ceres"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}

SMODS.Consumable {
    key = "sputnik_DetPlanet",
    set = "det_planet",
    atlas = "detC",
    pos = {x = 11, y = 3},
    config = {extra = {multbuff = .5, chipsbuff = .5, hand = "Flush Five", deteriorated = "Eris"}},
    loc_vars = function(self, info_queue, card)
        local t = G.GAME.hands[card.ability.extra.hand]
        return {vars = {t.original_l_mult and card.ability.extra.multbuff * t.original_l_mult or card.ability.extra.multbuff * t.l_mult, t.original_l_chips and card.ability.extra.chipsbuff * t.original_l_chips or card.ability.extra.chipsbuff * t.l_chips, card.ability.extra.hand, card.ability.extra.deteriorated}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local t = G.GAME.hands[card.ability.extra.hand]
        t.l_chips = t.l_chips + t.original_l_chips * card.ability.extra.chipsbuff
        t.l_mult = t.l_mult + t.original_l_mult * card.ability.extra.chipsbuff
    end
}