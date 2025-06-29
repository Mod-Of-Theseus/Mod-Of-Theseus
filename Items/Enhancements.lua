SMODS.Enhancement:take_ownership("glass", {
    atlas = "GlassEnhancement",
    pos = {
      x = 0,
      y = 0,
    },
    calculate = function(_self, card, context) -- _ prefix for unused args
      local hasReinforcedGlassJoker = next(SMODS.find_card("j_mot_reinforcedGlassJ", true))

      if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and pseudorandom('glass') < G.GAME.probabilities.normal / card.ability.extra then
        if hasReinforcedGlassJoker then
          for k, v in pairs(SMODS.find_card("j_mot_reinforcedGlassJ", true)) do
            G.E_MANAGER:add_event(Event({
              func = function()
                v:juice_up()
                return true
              end
            }))
          end

          print(localize("mot_glass_saved"))

          return {
            message_card = card,
            -- NOTE: ugly localization hack. don't remove
            message = localize({ type = "variable", key = "mot_glass_saved", vars = {} })
          }
        end

        return { remove = true }
      end
    end,
    update = function(_self, _card, _dt) -- _ prefix for unused args
      local center = G.P_CENTERS.m_glass

      local hasReinforcedGlassJoker = next(SMODS.find_card("j_mot_reinforcedGlassJ", true))

      if hasReinforcedGlassJoker then
        center.pos.x = 1
      else
        center.pos.x = 0
      end
    end
  },
  true)
