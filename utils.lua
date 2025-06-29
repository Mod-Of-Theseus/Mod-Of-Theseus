-- taken from the cryptid mod: https://github.com/SpectralPack/Cryptid/blob/bb8837d2db732558aea2863039bf0eb199594d20/lib/misc.lua#L924
function Card:is_food()
  --you cant really check if vanilla jokers are in a pool because its hardcoded
  --so i have to hardcode it here too for the starfruit unlock
  local food = {
    j_gros_michel = true,
    j_egg = true,
    j_ice_cream = true,
    j_cavendish = true,
    j_turtle_bean = true,
    j_diet_cola = true,
    j_popcorn = true,
    j_ramen = true,
    j_selzer = true,
  }
  if food[self.config.center.key] or (Cryptid and Cryptid.safe_get(self.config.center, "pools", "Food")) or ModofTheseus.safe_get(self.config.center, "pools", "Food") then
    return true
  end
end

function Card:is_bathroom()
  if ModofTheseus.safe_get(self.config.center, "pools", "Bathroom")
  -- or (Cryptid and Cryptid.safe_get(self.config.center, "pools", "Bathroom")) -- if cryptid for some reason adds bathroom jokers lmao
  then
    return true
  end
end

-- taken from cryptid and modified for ModOfTheseus: https://github.com/SpectralPack/Cryptid/blob/main/lib/misc.lua#L589
--Utility function to check things without erroring
---@param t table
---@param ... any
---@return table|false
function ModofTheseus.safe_get(t, ...)
  local current = t
  for _, k in ipairs({ ... }) do
    if not current or current[k] == nil then
      return false
    end
    current = current[k]
  end
  return current
end

---@param card table|Card
---@param source table|Card
function ModofTheseus.debuffed(card, source)
  if card.debuff then
    return {
      message = localize("k_debuffed"),
      colour = G.C.RED,
      card = source,
    }
  end
end
