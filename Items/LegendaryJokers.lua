--[[
 * LegendaryJokers.lua
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

SMODS.Joker {
  key = "jinxJ",
  pos = { x = 0, y = 0 },
  soul_pos = { x = 1, y = 0 },
  rarity = 4,
  atlas = "LegendJ",
  config = { extra = { X_mult = 2, mult_mod = 1 } },
  cost = 20,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.X_mult, card.ability.extra.mult_mod } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return { xmult = card.ability.extra.X_mult }
    end
    if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.jokers and not context.blueprint then
      card.ability.extra.X_mult = card.ability.extra.X_mult + card.ability.extra.mult_mod
      card.ability.extra.mult_mod = card.ability.extra.mult_mod + 1
    end
  end,

  joker_display_def = function(JokerDisplay)
    ---@type JDJokerDefinition
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "X_mult", retrigger_type = "exp" }
          }
        }
      },
    }
  end
}

SMODS.Joker {
  key = "altxxJ",
  pos = { x = 2, y = 0 },
  soul_pos = { x = 3, y = 0 },
  rarity = 4,
  atlas = "LegendJ",
  blueprint_compat = true,
  config = { extra = { repetitions = 2 } },
  cost = 20,
  loc_vars = function(self, info_queue, card)
    local suit = (G.GAME.current_round.ancient_card or {}).suit or 'Spades'
    return { vars = { localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] }, repetitions = 2 } }
  end,

  calculate = function(self, card, context)
    if context.repetition and context.other_card:is_suit(G.GAME.current_round.ancient_card.suit) and context.cardarea == G.play then
      return { message = 'Again!', repetitions = card.ability.extra.repetitions }
    end
  end,

  joker_display_def = function(JokerDisplay)
    ---@type JDJokerDefinition
    return {
      reminder_text = {
        { text = "(" },
        { ref_table = "G.GAME.current_round.ancient_card", ref_value = "suit" },
        { text = ")" },
      },
      style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] then
          reminder_text.children[2].config.colour = lighten(G.C.SUITS[G.GAME.current_round.ancient_card.suit], 0.35)
        end
        return false
      end,
      retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        return playing_card:is_suit(G.GAME.current_round.ancient_card.suit) and
            JokerDisplay.calculate_joker_triggers(joker_card) * joker_card.ability.extra.repetitions or 0
      end
    }
  end

}

SMODS.Joker {
  key = "titanJ",
  pos = { x = 4, y = 0 },
  soul_pos = { x = 5, y = 0 },
  rarity = 4,
  atlas = "LegendJ",
  blueprint_compat = true,
  config = { extra = { X_mult = 2 } },
  cost = 20,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.X_mult } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.other_card:is_suit("Spades") and context.cardarea == G.play then
      return { xmult = card.ability.extra.X_mult }
    end
  end,

  joker_display_def = function(JokerDisplay)
    ---@type JDJokerDefinition
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
      reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.SUITS["Spades"], 0.35) },
        { text = ")" }
      },
      calc_function = function(card)
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
          for _, scoring_card in pairs(scoring_hand) do
            if scoring_card:is_suit("Spades") then
              count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
          end
        end
        card.joker_display_values.x_mult = card.ability.extra.X_mult ^ count
        card.joker_display_values.localized_text = localize("Spades", 'suits_plural')
      end,
    }
  end
}

--The person who helped me with this function told me to add it outside the Joker object
--Not sure if it's a good idea or not but since it's global I think, you can use this with other legendaries too
-- the level_up_hand context hook used to be here. it's been moved to contexts.lua

SMODS.Joker {
  key = "victoryJ",
  pos = { x = 6, y = 0 },
  rarity = 4,
  atlas = "LegendJ",
  blueprint_compat = true,
  config = { extra = {
    X_chips = 1,
    X_chips_gain1 = 0.5,
    X_chips_gain2 = 2
  } },
  cost = 20,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.X_chips, card.ability.extra.X_chips_gain1, card.ability.extra.X_chips_gain2 } }
  end,

  calculate = function(self, card, context)
    if context.before and next(context.poker_hands['Straight']) then
      card.ability.extra.X_chips = card.ability.extra.X_chips + card.ability.extra.X_chips_gain1
      return {
        message = 'Upgraded!',
        colour = G.C.BLUE
      }
    end

    --This is where that calculate_context comes into play
    if context.upgrade_hand and context.hand == "Straight" then
      card.ability.extra.X_chips = card.ability.extra.X_chips + card.ability.extra.X_chips_gain2
      return {
        message = 'Upgraded!',
        colour = G.C.BLUE
      }
    end

    if context.joker_main then
      return {
        xchips = card.ability.extra.X_chips
      }
    end
  end
}
