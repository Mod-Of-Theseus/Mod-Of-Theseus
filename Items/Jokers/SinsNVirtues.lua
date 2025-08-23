SMODS.Joker {
  key = "pridefulJokerJ",
  pools = {
    ["sinfulPool"] = true
  },
  atlas = "CommonJ",
  blueprint_compat = true,
  pos = { x = 2, y = 0 },
  config = { extra = { multMax = 20 } },
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
  key = "enviousJokerJ",
  pools = {
    ["sinfulPool"] = true
  },
  atlas = "CommonJ",
  blueprint_compat = true,
  pos = { x = 3, y = 0 },
  config = { extra = {} },
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
  end
}