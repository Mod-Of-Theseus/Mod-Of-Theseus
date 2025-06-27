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
        Joker = {
            j_mot_blobbyJ = {
                name = "Blobby",
                text = {
                    "Every time a steel card is held in hand:",
                    "Exponentiate Mult from {X:mult,C:white}^.5{} to {X:mult,C:white}^3{}",
                    "{C:inactive}Art + Concept by inspectnerd{}",
                },
            },

            j_mot_jinxJ = {
                name = "Jinx",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult.",
                    "Increase by {X:mult,C:white}+#2#X{} at end of boss blind.",
                    "Then increase gain by 1 at end of boss blind.",
                    "{C:inactive}Art + Concept by jinxfucks{}",
                },
            },

            j_mot_altxxJ = {
                name = "Alt X.X",
                text = {
                    "Retrigger all {V:1}#1#{} cards twice",
                    "{C:inactive}Suit changes at end of round{}"
                },
            },

            j_mot_titanJ = {
                name = "Titan",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult for every",
                    "{C:spade}Spade{} card played and scored."
                },
            },

            j_mot_censoredJokerJ = {
                name = "Censored Joker",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult.",
                    "Increase by {X:mult,C:white}X#2#{} when selling a card.",
                    "Increase by {X:mult,C:white}X#3#{} when rerolling the shop.",
                    '{C:inactive}"Literally 1984" - The Blood Moth.{}'
                },
            },

            j_mot_rekojJ = {
                name = "Rekoj",
                text = {
                    "{C:chips}+#1#{} Chips",
                    '{C:inactive}"Oh no, it\'s Jimbo\'s evil cousin, Obmij!{}'
                },
            },

            j_mot_winningbigJ = {
                name = "Winning Big",
                text = {
                    "Gives {C:money}$#1#{} at end of round,",
                    "increases by {C:money}$#2#{} every time a lucky card triggers."
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
        dictionary = {
            k_mot_superb = {"Superb"},
            k_mot_omega = {"Omega"},
        },

        labels = {
            k_mot_superb = {"Superb"},
            k_mot_omega = {"Omega"},
        },
    },
}