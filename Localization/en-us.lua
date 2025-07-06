--[[
 * en-us.lua
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

return {
  descriptions = {
    Blind = {
      bl_mot_angel = {
        name = "The Angel",
        text = {
          "Cards are debuffed",
          "until play",
        },
      },

      bl_mot_demon = {
        name = "The Demon",
        text = {
          "Played cards have a",
          "#1# in 3 chance to",
          "become debuffed",
        },
      },

      bl_mot_lapis_loupe = {
        name = "Lapis Loupe",
        text = {
          "Play only your",
          "best possible hand",
        },
      },
    },

    Joker = {

      ---------------------------
      ------ COMMON JOKERS ------
      ---------------------------

      j_mot_rekojJ = {
        name = "Rekoj",
        text = {
          "{C:chips}+#1#{} Chips",
          '{C:inactive}"Oh no, it\'s Jimbo\'s evil cousin, Obmij!"{}'
        },
      },
      
      j_mot_saladNumberJ = {
        name = "Salad Number",
        text = {
          "{C:chips}+#1#{} chips",
          '{C:inactive}Its bigger... technically{}'
        },
      },

      j_mot_hashtagQookingJ = {
        name = "#1#Qooking",
        text = {
          "{C:chips}+#2#{} Chips for",
          "each {C:attention}Food Joker{} card",
          "{C:inactive}(Currently {C:blue}+#3#{C:inactive} Chips)",
        },

      },

      ---------------------------
      ----- UNCOMMON JOKERS -----
      ---------------------------

      j_mot_censoredJokerJ = {
        name = "Censored Joker",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult",
          "Increase by {X:mult,C:white}X#2#{} when selling a card",
          "Increase by {X:mult,C:white}X#3#{} when rerolling the shop",
          '{C:inactive}"Literally 1984" - The Blood Moth{}'
        },
      },

      j_mot_officeJobJ = {
        name = "Office Job",
        text = {
          "Earn {C:money}$#1#{} if played hand",
          "is a straight from {C:chips}9{} to {C:chips}5{}",
        },
      },

      j_mot_bucketOfChickenJ = {
        name = "Bucket of Chicken",
        text = {
          "{X:chips,C:white}X#1#{} {C:chips}Chips{}",
          "{X:chips,C:white}-#2#X{} {C:chips}Chips{} per",
          "round played",
        },
      },

      ---------------------------
      ------- RARE JOKERS -------
      ---------------------------

      j_mot_winningbigJ = {
        name = "Winning Big",
        text = {
          "Gives {C:money}$#1#{} at end of round,",
          "increases by {C:money}$#2#{} every time a lucky card triggers"
        }
      },

      j_mot_medusaJ = {
        name = "Medusa",
        text = {
          "All played {C:attention}face{} cards",
          "become {C:attention}Stone{} cards",
          "when scored",
          " ",
          "If all scoring cards are stone cards",
          "{C:red,s:1.1}+#1#{} Mult, then {X:mult,C:white,s:1.1}x#2#{} Mult",
        }
      },

      j_mot_hashtagQueenJ = {
        name = "#1#Queen",
        text = {
          "Played {C:attention}Queens{} each give",
          "{X:mult,C:white} X#2# {} Mult when scored",
        },
      },

      j_mot_daveJ = {
        name = "Dave",
        text = {
          "When sold, {C:green}#1# in #2# chance{}",
          "to {C:attention}double money{},",
          "set money to {C:money}$0{} otherwise"
        },
      },

      j_mot_cultContractJ = {
        name = "Cult Contract",
        text = {
          "Retrigger all scored {V:1}#2#{} cards",
          "{C:attention} #1# {} additional times",
          "All non-{V:1}#2#{} cards are debuffed"
        },
      },

      ---------------------------
      ------ SUPERB JOKERS ------
      ---------------------------

      j_mot_reinforcedGlassJ = {
        name = "Reinforced Glass",
        text = {
          "Prevents scoring {C:attention}glass{} cards from",
          "{C:red,E:1,S:1.1}shattering{}."
        }
      },

      ---------------------------
      ---- LEGENDARY JOKERS -----
      ---------------------------

      j_mot_jinxJ = {
        name = "Jinx",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "whenever a boss blind is defeated.",
          "Mult gain increases by {X:mult,C:white}X1{} with each",
          "boss blind defeated.",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
          "{C:inactive}Art + Concept by @jinxfucks{}",
        },
      },

      j_mot_altxxJ = {
        name = "Alt X.X",
        text = {
          "Retrigger all {V:1}#2#{} cards",
          "{C:attention}#1#{} times",
          "{C:inactive,s:0.8}suit changes at end of round",
        },
      },

      j_mot_titanJ = {
        name = "Titan",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult for every",
          "{C:spade}Spade{} card played and scored"
        },
      },

      j_mot_victoryJ = {
        name = "Victory Lap",
        text = {
          "Gains {X:chips,C:white}X#2#{} Chips if played hand is a {C:attention}Straight{}",
          "Gains {X:chips,C:white}X#3#{} Chips if Straight hand is {C:attention}leveled up{}",
          "{C:inactive}Currently {X:chips,C:white}X#1#{} {C:inactive}Chips{}"
        }
      },

      ---------------------------
      ------ OMEGA JOKERS -------
      ---------------------------

      j_mot_blobbyJ = {
        name = "Blobby",
        text = {
          "Every time a steel card is held in hand:",
          "Exponentiate Mult from {X:mult,C:white}^.5{} to {X:mult,C:white}^3{}",
          "{C:inactive}Art + Concept by inspectnerd{}",
        },
      },

      j_mot_gachaJ = {
        name = "Gacha Joker",
        text = {
            "Rolls a random joker every end of shop for {X:money,C:white}$#1#{}",
            "Every {C:green}#6#{} rolls, increases how many rolls you get by {C:green}1{}",
            "{C:green}#2#{C:inactive} rolls (Max: #7#)",
            "{C:inactive} #4#/#3# pity for legendary+",
        },
      },

    },

    Spectral = {
      c_mot_bermuda = {
        name = "Bermuda",
        text = {
          "Summon an Omega Joker,",
          "sets money to {C:money}-$20{}",
          "{C:inactive}Must have room{}"
        },
      },
    },
  },

  misc = {
    challenge_names = {
      c_mot_gachaC = "Gacha",
    },

    labels = {
      k_mot_superb = "Superb",
      k_mot_omega = "Omega",
    },

    dictionary = {
      k_mot_superb = "Superb",
      k_mot_omega = "Omega",
      k_not_enough_money = "Not enough money!",
      k_not_enough_slots = "Not enough slots!",
      k_rolled = "Rolled",
      k_mot_gacha = "Gacha Roll!",
    },

    v_dictionary = {
      mot_stone_singular = { "+#1# Stone" },
      mot_stone_plural = { "+#1# Stones" },
      mot_glass_saved = { "Saved!" },
      a_x_chips_minus = "-#1#X",
    }
  },
}
