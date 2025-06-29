--[[
 * Main.lua
 * This file is part of Mod of Theseus
 *
 * Copyright (C) 2025 Mod of Theseus
 *
 * Mod of Theseus is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Mod of Theseus is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Mod of Theseus; if not, see <https://www.gnu.org/licenses/>.
]]

if not ModofTheseus then
  ModofTheseus = {}
end

ModofTheseus = {
  show_options_button = true,
}

ModofTheseus = SMODS.current_mod
ModofTheseus_config = ModofTheseus.config
ModofTheseus.enabled = copy_table(ModofTheseus_config)

SMODS.Atlas {
  object_type = "Atlas",
  key = "PLH",
  path = "placeholders.png",
  px = 71,
  py = 95,
}

SMODS.Atlas {
  key = "tarot",
  path = "Tarots.png",
  px = 71,
  py = 95,
}

SMODS.Atlas {
  key = "CommonJ",
  path = "CommonJokers.png",
  px = 71,
  py = 95
}

SMODS.Atlas({
  key = "UncommonJ",
  path = "UncommonJokers.png",
  px = 71,
  py = 95
})

SMODS.Atlas({
  key = "MedusaJ",
  path = "MedusaJoker.png",
  px = 71,
  py = 95
})

SMODS.Atlas({
  key = "GlassEnhancement",
  path = "GlassEnhancement.png",
  px = 71,
  py = 95
})

SMODS.Atlas {
  key = "RareJ",
  path = "RareJokers.png",
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = "LegendJ",
  path = "LegendaryJokers.png",
  px = 71,
  py = 95,
}

SMODS.Atlas {
  key = "OmegaJ",
  path = "OmegaJokers.png",
  px = 71,
  py = 95,
}

SMODS.Atlas {
  key = 'Blinds',
  path = 'Blinds.png',
  px = 34,
  py = 34,
  frames = 21,
  atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Atlas {
  key = 'BlindsFinisher',
  path = 'BlindsFinisher.png',
  px = 34,
  py = 34,
  frames = 21,
  atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Rarity {
  key = "superb",
  pools = { ["Joker"] = true },
  default_weight = 0.01,
  badge_colour = HEX('ffb0b5'),
}

SMODS.Rarity {
  key = "omega",
  pools = { ["Joker"] = true },
  default_weight = 0,
  badge_colour = HEX('000000'),
}

assert(SMODS.load_file("Items/Blinds.lua"))()
assert(SMODS.load_file("Items/CommonJokers.lua"))()
assert(SMODS.load_file("Items/Consumables.lua"))()
assert(SMODS.load_file("Items/LegendaryJokers.lua"))()
assert(SMODS.load_file("Items/OmegaJokers.lua"))()
assert(SMODS.load_file("Items/RareJokers.lua"))()
assert(SMODS.load_file("Items/UncommonJokers.lua"))()
assert(SMODS.load_file("Items/Boosters.lua"))()
assert(SMODS.load_file("Items/Enhancements.lua"))()
assert(SMODS.load_file("contexts.lua"))()
assert(SMODS.load_file("utils.lua"))()
