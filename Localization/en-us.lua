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
          "{C:attention,E:1}best{} possible hand",
        },
      },
    },

    det_tarot = {
      c_mot_detFool = {
        name = "The Fool?",
        text = {
          "Create the last deteriorated",
          "tarot or planet used"
        }
      },

      c_mot_detHanged = {
        name = "Hanged Man?",
        text = {
          "Create #1# random cards"
        }
      }
    },

    spellCard = {
      c_mot_fireballSpl = {
        name = "Fireball",
        text = {
          "Destroy #1# random cards"
        }
      },

      c_mot_ritualSpl = {
      name = "Ritual",
        text = {
          "Create a random Spectral card",
          "Then make a random spell card if there's room"
        }
      },

      c_mot_immortalitySpl = {
        name = "Immortality",
        text = {
          "Turn 1 selected Joker eternal"
        }
      },

      c_mot_mageHandSpl = {
        name = "Mage Hand",
        text = {
          "Increase hand size by 1"
        }
      },

      c_mot_pocketDimensionSpl = {
        name = "Pocket Dimension",
        text = {
          "Gain 1 consumable slot"
        }
      },

      c_mot_darknessSpl = {
        name = "Darkness",
        text = {
          "Turn one selected joker Negative",
          "reduces handsize by 2"
        }
      },

      c_mot_polymorphSpl = {
        name = "Polymorph",
        text = {
          "Swap everything on 2 selected cards"
        }
      },

      c_mot_creationSpl = {
        name = "Creation",
        text = {
          "+1 shop slot"
        }
      }
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
          "each {C:attention}Food Joker{} owned",
          "{C:inactive}(Currently {C:blue}+#3#{C:inactive} Chips)",
        },

      },

      j_mot_pridefulJokerJ = {
        name = "Prideful Joker",
        text = {
          "Gives {C:mult}Mult{} equal to",
          "{C:attention}#1#{} minus your {C:attention}current dollars{}"
        }
      },

      ---------------------------
      ----- UNCOMMON JOKERS -----
      ---------------------------

      j_mot_censoredJokerJ = {
        name = "Censored Joker",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} when selling a card",
          "and gains {X:mult,C:white}X#3#{} when rerolling the shop",
          "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
          '{C:inactive}"Literally 1984" - The Blood Moth.{}'
        },
      },

      j_mot_officeJobJ = {
        name = "Office Job",
        text = {
          "Earn {C:money}$#1#{} if played hand",
          "is a Straight that contains a {C:attention}9{} and {C:attention}5{}", --contraversial but give me an example of a straight that contains 9 and 5 but isnt a 9-5 straight
        },
      },

      j_mot_bucketOfChickenJ = {
        name = "Bucket of Chicken",
        text = {
          "{X:chips,C:white}X#1#{} Chips",
          "{X:chips,C:white}-#2#X{} Chips at end of round", --i know vanilla popcorn says "per round played" but vanilla formatting isn't always the most clear
        },
      },

      ---------------------------
      ------- RARE JOKERS -------
      ---------------------------

      j_mot_winningbigJ = {
        name = "Winning Big",
        text = {
          "Earn {C:money}$#1#{} at end of round",
          "Increases by {C:money}$#2#{} every time a lucky card triggers"
        }
      },

      j_mot_medusaJ = {
        name = "Medusa",
        text = {
          "All played {C:attention}face{} cards become",
          "{C:attention}Stone{} cards when scored",
          "{C:mult}+#1#{} Mult and {X:mult,C:white}X#2#{} Mult if all",
          "scoring cards are {C:attention}Stone{} cards",
        }
      },

      j_mot_hashtagQueenJ = {
        name = "#1#Queen",
        text = {
          "Played {C:attention}Queens{} each give",
          "{X:mult,C:white}X#2#{} Mult when scored",
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

      j_mot_wizardJ = {
        name = "Wizard Joker",
        text = {
          "Create a random Spell",
          "when blind is selected"
        }
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

      j_mot_cultContractJ = {
        name = "Cult Contract",
        text = {
          "Retrigger all scored {V:1}#2#{} cards",
          "{C:attention}#1#{} additional times",
          "All non-{V:1}#2#{} cards are debuffed"
        },
      },

      ---------------------------
      ---- LEGENDARY JOKERS -----
      ---------------------------

      j_mot_jinxJ = {
        name = "Jinx",
        text = {
          "When {C:attention}Boss Blind{} defeated, this joker gains",
          "{X:mult,C:white}X#2#{} Mult and increases the gain by {X:mult,C:white}X1{}",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
        },
      },

      j_mot_altxxJ = {
        name = "Alt X.X",
        text = {
          "{C:attention}Retrigger{} all {V:1}#2#{} cards",
          "{C:attention}#1#{} times.",
          "Suit changes at end of round",
        },
      },

      j_mot_titanJ = {
        name = "Titan",
        text = {
          "{C:spade}Spades{} give {X:mult,C:white}X#1#{} Mult when scored",
        },
      },

      j_mot_victoryJ = {
        name = "Victory Lap",
        text = {
          "Gains {X:chips,C:white}X#2#{} Chips if played hand is a {C:attention}Straight{}",
          "Gains {X:chips,C:white}X#3#{} Chips when {C:attention}Straight{} is {C:attention}leveled up{}", --both the american and british spelling of "levelled" suck
          "({C:inactive}Currently {X:chips,C:white}X#1#{} {C:inactive}Chips{})"
        }
      },

      ---------------------------
      ------ OMEGA JOKERS -------
      ---------------------------

      j_mot_blobbyJ = {
        name = "Blobby",
        text = {
          "{X:dark_edition,C:white}^0.5-3{} Mult for each",
          "{C:attention}Steel Card{} held in hand",
          "{C:inactive}Art + Concept by inspectnerd{}",
        },
      },

      j_mot_gachaJokerJ = {
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
          "{C:inactive,S:0.8}Must have room{}"
        },
      },

      c_mot_highway = {
        name = "Highway",
        text = {
          "Create a random",
          "{C:red,E:1}Sinful{} Joker"
        }
      }
    },
  },

  misc = {
    challenge_names = {
      c_mot_gachaC = "Gacha",
      c_mot_deadEndC = "Dead End"
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
