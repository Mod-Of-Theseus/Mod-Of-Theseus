--[[
 * Config.lua
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


-- Config Stuff
local motConfigTabs = function()
  local configTabs = {
      {n = G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {
          {n = G.UIT.T, config = {text = "Hello!", colour = G.C.UI.TEXT_LIGHT, scale = 0.5}}
      }}
  }
	local left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	local right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	local config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { left_settings, right_settings } }

  configTabs[#configTabs + 1] = config
  configTabs[#configTabs + 1] = create_toggle({
      label = "Deterioration: ",
      active_colour = HEX("40c76d"),
      ref_table = ModofTheseus.config,
      ref_value = "deteriorationOn"
    })
  configTabs[#configTabs + 1] = {
    n = G.UIT.R,
    config = { align = "cm", padding = 0.05 },
    nodes = {
      { n = G.UIT.T, config = { text = "Reset Meta Progression: ", colour = G.C.UI.TEXT_LIGHT, scale = 0.4 } },
      {
        n = G.UIT.C,
        config = {
          button = "mot_reset_meta",
          minh = 0.6,
          minw = 2,
          r = 0.1,
          colour = G.C.RED,
          hover = true,
          padding = 0.1,
          align = "cm",
        },
        nodes = {
          { n = G.UIT.T, config = { text = "Reset", colour = G.C.UI.TEXT_LIGHT, scale = 0.35 } }
        }
      }
    }
  }
  return {
      n = G.UIT.ROOT,
      config = {
              emboss = 0.05,
              minh = 6,
              r = 0.1,
              minw = 10,
              align = "cm",
              padding = 0.2,
              colour = G.C.BLACK,
      },
      nodes = configTabs,
	}
end

SMODS.current_mod.config_tab = motConfigTabs

G.FUNCS.mot_reset_meta = function(e)
    ModofTheseus.reset_meta()
    play_sound("button", 0.7)
end

