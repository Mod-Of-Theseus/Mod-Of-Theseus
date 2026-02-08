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

      bl_mot_black_print = {
        name = "Black Print",
        text = {
          "Debuff all {C:red,E:1}Blueprints{}",
          "and {C:red,E:1}Brainstorms{}"
        }
      }
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
      },

      c_mot_detPriestess = {
        name = "High Priestess?",
        text = {
          "Creates up to #1# random",
          "{C:attention,E:1}Satellite{} cards"
        }
      },
    },

    det_planet = {
      c_mot_newHorizons_DetPlanet = {
        name = "New Horizons",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_messenger_DetPlanet = {
        name = "Messenger",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_jamesWebb_DetPlanet = {
        name = "James Webb",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_venera_DetPlanet = {
        name = "Venera",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_cassini_DetPlanet = {
        name = "Cassini",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_juno_DetPlanet = {
        name = "Juno",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_iss_DetPlanet = {
        name = "I.S.S.",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_odyssey_DetPlanet = {
        name = "Odyssey",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_gps_DetPlanet = {
        name = "GPS",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_voyager_DetPlanet = {
        name = "Voyager",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_dawn_DetPlanet = {
        name = "Dawn",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },

      c_mot_sputnik_DetPlanet = {
        name = "Sputnik",
        text = {
          "Upgrade {C:attention,E:1}#4#{} for a singular use",
          "{C:chips,S:.7}+#2# Chips{} {C:inactive,S:.7}and{} {C:mult,S:.7}+#1# Mult{}"
        }
      },
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
          "then make it rental"
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
            "Played {C:red,E:1}suitless{} or {C:red,E:1}omni-suited{}",
            "cards give {C:mult}+#1#{} Mult when scored",
        }
      },

      j_mot_enviousJokerJ = {
        name = "Envious Joker",
        text = {
          "Gives {C:mult}Mult{} equal to",
          "{C:attention}#1#{} minus your {C:attention}current dollars{}"
        }
      },

      j_mot_slothfulJokerJ = {
        name = "Slothful Joker",
        text = {
          "{C:attention}Unplayed{} cards give",
          "{C:mult}+#1#{} Mult when held in hand"
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
          "is a Straight that contains a {C:attention}9{} and {C:attention}5{}", --contraversial but give me an example of a straight that contains 9 and 5 but isnt a 9-5 straight "Shortcut: J/10, 9, 7/6, 5, 4/3" - Moth
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
          "{C:mult}+#1#{} Mult if all scoring cards",
          " are {C:attention}Stone{} cards",
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

      j_mot_skillCheckJ = {
        name = "Skill Check",
        text = {
          "Gives {C:chips}Chips{} equal to",
          "the amount of times you've {C:attention}Clicked{}",
          "Resets at end of round",
          "{C:inactive,S:0.8}Currently {C:attention}#1#{}{}"
        }
      },

      j_mot_brokenFaithJ = {
        name = "Broken Faith",
        text = {
          "Whenever a {C:attentionE:1}Boss Blind{} is defeated,",
          " create a random {C:red,E:1}Sin{}"
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
          "Retrigger all {V:1}#2#{} cards",
          "{C:attention}#1#{} additional times",
          "All non-{V:1}#2#{} cards are debuffed"
        },
      },

      j_mot_ringOfLimboJ = {
        name = "Ring Of Limbo",
        text = {
          "Whenever a {C:red,E:1}Sin{} is sold,",
          "this card gains {X:mult,C:white}#1#x{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },

      j_mot_ringOfLustJ = {
        name = "Ring Of Lust",
        text = {
          "Every time a {C:attention}Lusty Joker{} triggers,",
          "this Joker gains {X:mult,C:white}#1#x{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },

      j_mot_ringOfGluttonyJ = {
        name = "Ring Of Gluttony",
        text = {
          "Every time a {C:attention}Gluttonous Joker{} triggers,",
          "this Joker gains {X:mult,C:white}#1#x{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },

      j_mot_ringOfGreedJ = {
        name = "Ring Of Greed",
        text = {
          "Every time a {C:attention}Greedy Joker{} triggers,",
          "this Joker gains {X:mult,C:white}#1#x{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },

      j_mot_ringOfWrathJ = {
        name = "Ring Of Wrath",
        text = {
          "Every time a {C:attention}Wrathful Joker{} triggers,",
          "this Joker gains {X:mult,C:white}#1#x{} Mult",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
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

      j_mot_zygornJ = {
        name = "Zygorn Republic",
        text = {
          "Every time you destroy or sell a debuffed card or joker" ,
          "this joker gains {X:mult,C:white}^#1#{}",
          "{C:inactive,S0.8}Currently {X:mult,C:white}^#2#{}",
          --[[
          "{C:inactive,S:0.8}Shattered-- destroyed and blood stained.{}",
          "{C:inactive,S:0.8}But it pertains and for each fall it came back{}",
          "{C:inactive,S:0.8}stronger, until it dominated--{}",
          "{C:inactive,S:0.8}let lessons be learned; justice be served{}"
          ]]
        }
      },

    },

      j_mot_fireiceJ = {
        name = "FireIce",
        text = {
          "Gain {X:dark_edition,C:white}^1{} Mult for each used {X:spectral,C:white}Spectral{},",
          "{X:dark_edition,C:white}^0.25{} Mult for each used {X:tarot,C:white}Tarot{} or {X:planet,C:white}Planet{}.",
          "{C:inactive}Additional {X:dark_edition,C:white}^0.25{}{C:inactive} if {X:dark,C:white}Deteriorated{}.",
          "{C:inactive}Currently: {X:dark_edition,C:white}^#1#{}"
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

    Other = {
      p_mot_sinful_normal = {
        name = "Sinful Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
          "{C:red,E:1}Sinful{} jokers",
        }
      },

      p_mot_sinful_jumbo = {
        name = "Jumbo Sinful Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
          "{C:red,E:1}Sinful{} jokers",
        }
      },

      p_mot_sinful_mega = {
        name = "Mega Sinful Pack",
        text = {
          "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
          "{C:red,E:1}Sinful{} jokers",
        }
      },
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
      k_mot_sinful_pack = "Sinful Pack",
      k_mot_upgrade = "Upgrade!"
    },

    v_dictionary = {
      mot_stone_singular = { "+#1# Stone" },
      mot_stone_plural = { "+#1# Stones" },
      mot_glass_saved = { "Saved!" },
      a_x_chips_minus = "-#1#X",
    }
  },
}
