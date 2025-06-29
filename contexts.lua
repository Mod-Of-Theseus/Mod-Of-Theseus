-- this hooks into the level_up_hand and provides some extra context
local original_level_up_hand = level_up_hand
function level_up_hand(card, hand, instant, amount)
  local level_by = amount or 1
  SMODS.calculate_context({ upgrade_hand = (level_by > 0), hand = hand })
  original_level_up_hand(card, hand, instant, level_by)
end
