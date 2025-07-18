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

-- checks if the card is in a pool with the given key
-- for checking if it's a food joker use is_food instead
---@param pool_key string
function Card:is_in_pool(pool_key)
  if ModofTheseus.safe_get(self.config.center, "pools", pool_key)
      or (Cryptid and Cryptid.safe_get(self.config.center, "pools", pool_key))
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

-- neat utility made by the wonderful abigail. types by jinxfucks
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

-- gets the lowest rank in provided hand
---@param hand (Card[]|table[])
function ModofTheseus.get_lowest(hand)
  local temp_ID = 15
  local lowest_card = nil

  for _k, v in ipairs(hand) do
    if temp_ID >= v:get_id() and not SMODS.has_no_rank(v) then
      temp_ID = v:get_id()
      lowest_card = v
    end
  end

  return lowest_card
end

-- gets the highest rank in provided hand
---@param hand (Card[]|table[])
function ModofTheseus.get_highest(hand)
  local temp_ID = 0
  local highest_card = nil

  for _k, v in ipairs(hand) do
    if temp_ID <= v:get_id() and not SMODS.has_no_rank(v) then
      temp_ID = v:get_id()
      highest_card = v
    end
  end

  return highest_card
end

function create_dynatext_badge(dynatext, background_colour)
  -- No idea how any of this works, it's just a slightly modified version of create_badge
  return {
    n = G.UIT.R,
    config = { align = "cm" },
    nodes = {
      {
        n = G.UIT.R,
        config = { align = "cm", colour = background_colour or G.C.GREEN, r = 0.1, minw = 2, minh = 0.4, emboss = 0.05, padding = 0.03 },
        nodes = {
          { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
          { n = G.UIT.O, config = { object = dynatext } },
          { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
        }
      }
    }
  }
end

function titlecase(str)
  return (str:gsub("(%a)([%w_']*)", function(first, rest)
    return first:upper() .. rest:lower()
  end))
end
