--[[
 * RareJokers.lua
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

SMODS.Joker { -- Winning Big
  key = "winningbigJ",
  atlas = "RareJ",
  rarity = 3,
  pos = { x = 1, y = 0 },
  config = { extra = { dollars = 1, money_mod = 1 } },
  cost = 10,
  blueprint_compat = false,
  mot_credits = {
    idea = {
      "Yo Fish",
    },
    art = {
      "Abducted",
    },
    code = {
      "Mothball",
      "Hoarfrost Trickle",
    },
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.money_mod } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
      card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.money_mod
      return {
        messsage = localize('k_upgrade_ex'),
        colour = G.C.MONEY
      }
    end
  end,

  calc_dollar_bonus = function(self, card)
    return card.ability.extra.dollars
  end,

  joker_display_def = function(JokerDisplay)
    ---@type JDJokerDefinition
    return {
      text = {
        { text = "+$" },
        { ref_table = "card.ability.extra", ref_value = "dollars" },
      },
      text_config = { colour = G.C.GOLD },
      reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
      },
      calc_function = function(card)
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
      end
    }
  end

}

SMODS.Joker{ -- Medua
  key = "medusaJ",
  atlas = "RareJ",
  pos = { x = 0, y = 0 },
  rarity = 3,
  cost = 8,
  mot_credits = {
    idea = {
      "Goldog", -- Pluey
    },
    art = {
      "Goldog", -- Pluey
    },
    code = {
      "Jinx",
      "Hoarfrost Trickle",
    },
  },
  config = {
    extra = {
      mult = 100, x_mult = 2,
    }
  },
  loc_vars = function(_self, _info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.x_mult,
      }
    }
  end,
  blueprint_compat = true,
  calculate = function(_self, card, context)
    if context.before and context.main_eval and not context.blueprint and context.scoring_hand then
      local faces = 0

      for _, scored_card in ipairs(context.scoring_hand) do
        if scored_card:is_face() then
          faces = faces + 1
          scored_card:set_ability("m_stone", nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              scored_card:juice_up()
              return true
            end
          }))
        end
      end

      if faces > 0 then
        return {
          message = localize({
            type = "variable",
            key = faces == 1 and "mot_stone_singular" or "mot_stone_plural",
            vars = { faces }
          }),
          message_card = card,
          colour = G.C.GREY
        }
      end
    end




    if context.joker_main then
      local stone_tally = 0

      for _, scored_card in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(scored_card, "m_stone") then
          stone_tally = stone_tally + 1
        end
      end

      if stone_tally == #context.scoring_hand then
        return {
          mult = card.ability.extra.mult,
          x_mult = card.ability.extra.x_mult
        }
      end
    end
  end,




  joker_display_def = function(JokerDisplay)
    ---@type JDJokerDefinition
    return {
      text = {
        { text = "+", colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult", colour = G.C.MULT, retrigger_type = "mult" },
        {
          border_nodes = {
            { text = "X", },
            { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
          }
        },
      },
      calc_function = function(card)
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        if #scoring_hand == 0 then
          card.joker_display_values.mult = 0
          card.joker_display_values.x_mult = 0
          return
        end
        for _, scored_card in ipairs(scoring_hand) do
          if not SMODS.has_enhancement(scored_card, "m_stone") then
            card.joker_display_values.mult = 0
            card.joker_display_values.x_mult = 0
            return
          end
        end
        card.joker_display_values.mult = card.ability.extra.mult
        card.joker_display_values.x_mult = card.ability.extra.x_mult
      end
    }
  end
}


SMODS.Joker { -- #Queen
  key = "hashtagQueenJ",
  atlas = "RareJ",
  rarity = 3,
  pos = { x = 3, y = 0 },
  config = { extra = { x_mult = 1.5, dumb_fucking_workaround = "#" } },
  cost = 10,
  pools = { ["Q"] = true },
  blueprint_compat = true,
  mot_credits = {
    idea = {
      "Jinx",
    },
    art = {
      -- "bologna",
    },
    code = {
      "Jinx",
    },
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dumb_fucking_workaround, card.ability.extra.x_mult } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,

  -- todo: add joker display compatibility @chore
}

SMODS.Joker { -- Dave
  key = "daveJ",
  pos = { x = 2, y = 0 },
  rarity = 3,
  atlas = "RareJ",
  config = { extra = { odds = 2 } },
  cost = 9,
  pools = {
    ["Food"] = true
  },
  blueprint_compat = true, -- Made consistent with other effects
  mot_credits = {
    idea = {
      "bologna",
    },
    art = {
      "bologna",
    },
    code = {
      "Cardboard",
    },
},
  loc_vars = function(self, info_queue, card)
    return { vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
  end,
  --either this or i hook another function
  add_to_deck = function (self, card, from_debuff)
    card.ability.extra_value = (-card.sell_cost)
    card:set_cost()
  end,
  calculate = function(self, card, context)
    if context.selling_self then
      if pseudorandom('dave') < G.GAME.probabilities.normal / card.ability.extra.odds then
        return { 
          dollars = to_number(to_big(G.GAME.dollars))
        }
      else
        return { 
          dollars = to_number(to_big(-G.GAME.dollars))
        }
      end
    end
  end
}

SMODS.Joker{ -- Wizard
  key = "wizardJ",
  atlas = "PLH",
  rarity = 3,
  pos = {x = 2, y = 0},
  config = {extra = {spellsGiven = 1}}, -- Unlikely to change in the future
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and #G.consumeables.cards < G.consumeables.config.card_limit then
      SMODS.add_card{
        set = "spellCard"
      }
    end
  end
}