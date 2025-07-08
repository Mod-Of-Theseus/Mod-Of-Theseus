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

SMODS.ObjectType {
  key = "sinfulPool",
  default = "lusty_joker"
}

SMODS.Atlas {
  object_type = "Atlas",
  key = "PLH",
  path = "placeholders.png",
  px = 71,
  py = 95,
}

SMODS.Atlas {
  key = "detC",
  path = "DeterioratedConsumables.png",
  px = 71,
  py = 95
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
  key = "SuperbJ",
  path = "SuperbJokers.png",
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

-- Jokers
function loadJokers()
  assert(SMODS.load_file("Items/Jokers/CommonJokers.lua"))()
  assert(SMODS.load_file("Items/Jokers/UncommonJokers.lua"))()
  assert(SMODS.load_file("Items/Jokers/RareJokers.lua"))()
  assert(SMODS.load_file("Items/Jokers/SuperbJokers.lua"))()
  assert(SMODS.load_file("Items/Jokers/LegendaryJokers.lua"))()
  assert(SMODS.load_file("Items/Jokers/OmegaJokers.lua"))()
end

-- Consumables
function loadConsumables()
  assert(SMODS.load_file("Items/Consumable Related/Consumables.lua"))()
  assert(SMODS.load_file("Items/Consumable Related/Boosters.lua"))()
  assert(SMODS.load_file("Items/Consumable Related/Enhancements.lua"))()
  assert(SMODS.load_file("Items/Consumable Related/Vanilla Based/TarotCards.lua"))()
  assert(SMODS.load_file("Items/Consumable Related/Vanilla Based/PlanetCards.lua"))()
  assert(SMODS.load_file("Items/Consumable Related/Vanilla Based/SpectralCards.lua"))()
  assert(SMODS.load_file("Items/Consumable Related/DetConsumables.lua"))()
end

-- Blind / Antes
assert(SMODS.load_file("Items/Blinds.lua"))()

-- Challenges
assert(SMODS.load_file("Items/Challenges.lua"))()

-- Mod Utilities
assert(SMODS.load_file("overrides.lua"))()
assert(SMODS.load_file("contexts.lua"))()
assert(SMODS.load_file("utils.lua"))() -- not technically used yet, but don't remove it. *cough cough* seph *cough cough* /lh
assert(SMODS.load_file("Items/Jokers/OwnershipClaiming.lua"))()

loadJokers()
loadConsumables()