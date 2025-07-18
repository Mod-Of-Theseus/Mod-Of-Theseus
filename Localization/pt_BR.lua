--[[
 * pt-br.lua
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
        name = "O anjo",
        text = {
          "Cartas ganham desvantagem",
          "até jogar",
        },
      },

      bl_mot_demon = {
        name = "O demônio",
        text = {
          "Cartas jogadas têm uma",
          "chance de #1# em 3 de",
          "ganharem desvantagem",
        },
      },

      bl_mot_lapis_loupe = {
        name = "Lupa lápis-lazuli",
        text = {
          "Somente jogue sua",
          "{C:attention,E:1}melhor{} mão possível",
        },
      },
    },

    det_tarot = {
      c_mot_detFool = {
        name = "O tolo?",
        text = {
          "Crie a ultima carta deteriorada de ",
          "tarot ou planeta usada"
        }
      },

      c_mot_detHanged = {
        name = "O enforcado?",
        text = {
          "Crie #1# cartas aleatórias"
        }
      }
    },

    spellCard = {
      c_mot_fireballSpl = {
        name = "Bola de fogo",
        text = {
          "Destrói #1# cartas aleatórias"
        }
      },

      c_mot_ritualSpl = {
      name = "Ritual",
        text = {
          "Cria uma carta spectral aleatória",
          "Então faça uma carta de feitiço aleatória se tiver espaço"
        }
      },

      c_mot_immortalitySpl = {
        name = "Imortalidade",
        text = {
          "Transforma o curinga selecionado em eterno"
        }
      },

      c_mot_mageHandSpl = {
        name = "Mão de mago",
        text = {
          "Aumenta o tamanho da mão em 1"
        }
      },

      c_mot_pocketDimensionSpl = {
        name = "Dimensão portátil",
        text = {
          "Ganha um espaço de consúmivel"
        }
      },

      c_mot_darknessSpl = {
        name = "Escuridão",
        text = {
          "Transforma m Curinga selecionado em negativo",
          "reduz tamanho da mão em 2"
        }
      },

      c_mot_polymorphSpl = {
        name = "Polimorfo",
        text = {
          "Troca tudo entre 2 cartas selecionadas"
        }
      },

      c_mot_creationSpl = {
        name = "Criação",
        text = {
          "+1 espaço de loja"
        }
      }
    },

    Joker = {

      ---------------------------
      ------ COMMON JOKERS ------
      ---------------------------

      j_mot_rekojJ = {
        name = "Agniruc",
        text = {
          "{C:chips}+#1#{} Fichas",
          '{C:inactive}"Oh não, é o primo maligno de Jimbo, Obmij!"{}'
        },
      },
      
      j_mot_saladNumberJ = {
        name = "Número de Salada",
        text = {
          "{C:chips}+#1#{} Fichas",
          '{C:inactive}É maior... tecnicamente{}'
        },
      },

      j_mot_hashtagQookingJ = {
        name = "#1#Qozinhando",
        text = {
          "{C:chips}+#2#{} Fichas para",
          "cada {C:attention}Curinga comestível{}",
          "{C:inactive}(Atualmente {C:blue}+#3#{C:inactive} Fichas)",
        },

      },

      j_mot_pridefulJokerJ = {
        name = "Curinga orgulhoso",
        text = {
          "Dá {C:mult}Multi{} igual a",
          "{C:attention}#1#{} menos sua {C:attention}Quantidade de grana{}"
        }
      },

      ---------------------------
      ----- UNCOMMON JOKERS -----
      ---------------------------

      j_mot_censoredJokerJ = {
        name = "Curinga Censurado",
        text = {
          "Dá {X:mult,C:white}X#1#{} Multi",
          "Aumenta por {X:mult,C:white}X#2#{} quando vender uma carta",
          "Aumenta por {X:mult,C:white}X#3#{} quando atualizar a loja",
          '{C:inactive}"Literalmente 1984" - The Blood Moth{}'
        },
      },

      j_mot_officeJobJ = {
        name = "Trabalho de Escritório",
        text = {
          "Ganha {C:money}$#1#{} se a mão jogada",
          "for uma sequência de {C:chips}9{} a {C:chips}5{}",
        },
      },

      j_mot_bucketOfChickenJ = {
        name = "Balde de frango frito",
        text = {
          "{X:chips,C:white}X#1#{} {C:chips}Fichas{}",
          "{X:chips,C:white}-#2#X{} {C:chips}Fichas{} por",
          "rodada jogada",
        },
      },

      ---------------------------
      ------- RARE JOKERS -------
      ---------------------------

      j_mot_winningbigJ = {
        name = "Ganhando Grande",
        text = {
          "Dá {C:money}$#1#{} no final da rodada,",
          "aumenta em {C:money}$#2#{} toda vez que uma carta da sorte é ativada"
        }
      },

      j_mot_medusaJ = {
        name = "Medusa",
        text = {
          "Todas as{C:attention}cartas de Realeza {}",
          "se tornam {C:attention}Stone{} cards",
          "quando pontuada",
          " ",
          "Se todas as cartas pontuadas forem stone cards",
          "{C:red,s:1.1}+#1#{} Multi, então {X:mult,C:white,s:1.1}x#2#{} Multi",
        }
      },

      j_mot_hashtagQueenJ = {
        name = "#1#Rainha",
        text = {
          "Cada {C:attention}Rainha{} jogada dá",
          "{X:mult,C:white} X#2# {} Multi quando pontuada",
        },
      },

      j_mot_daveJ = {
        name = "Dave",
        text = {
          "Quando vendido, {C:green}chance de #1# em #2#{}",
          "de {C:attention}duplicar grana{},",
          "pôe grana em {C:money}$0{} caso contrário"
        },
      },

      j_mot_cultContractJ = {
        name = "Contrato de Culto",
        text = {
          "Reativa todas cartas do naipe {V:1}#2#{} ",
          "{C:attention} #1# {} vezes",
          "Todas as cartas que não são do naipe -{V:1}#2#{} ganham desvantagem",
        },
      },

      j_mot_wizardJ = {
        name = "Curinga mago",
        text = {
          "Cria um {C:purple}Feitiço{}",
          "quando blind é selecionado"
        }
      },

      ---------------------------
      ------ SUPERB JOKERS ------
      ---------------------------

      j_mot_reinforcedGlassJ = {
        name = "Vidro reforçado",
        text = {
          "Impede que {C:attention}Cartas de vidro{}",
          "{C:red,E:1,S:1.1}Quebrem{}."
        }
      },

      ---------------------------
      ---- LEGENDARY JOKERS -----
      ---------------------------

      j_mot_jinxJ = {
        name = "Jinx",
        text = {
          "Este curinga ganha {X:mult,C:white}X#2#{} Multi",
          "Sempre que um blind de chefe é derrotado.",
          "O ganho de Multi aumenta em {X:mult,C:white}X1{} com cada",
          "blind de chefe derrotado.",
          "{C:inactive}(Atualmente {X:mult,C:white} X#1# {C:inactive} Multi)",
        },
      },

      j_mot_altxxJ = {
        name = "Alt X.X",
        text = {
          "Reativa cartas do naipe {V:1}#2#{}",
          "{C:attention}#1#{} vezes",
          "{C:inactive,s:0.8}naipe muda no final da rodada",
        },
      },

      j_mot_titanJ = {
        name = "Titã",
        text = {
          "Dá {X:mult,C:white}X#1#{} Multi por cada",
          "{C:spade}Espadas{} jogada e pontuada"
        },
      },

      j_mot_victoryJ = {
        name = "Volta da vitória",
        text = {
          "Ganha {X:chips,C:white}X#2#{} Fichas se mão jogada é uma  {C:attention}Sequência{}",
          "Ganha {X:chips,C:white}X#3#{} Fichas se seqência  {C:attention}Subir de nível{}",
          "{C:inactive}Atualmente {X:chips,C:white}X#1#{} {C:inactive}Fichas{}"
        }
      },

      ---------------------------
      ------ OMEGA JOKERS -------
      ---------------------------

      j_mot_blobbyJ = {
        name = "Blobby",
        text = {
          "Toda vez que uma carta de aço permanece na mão:",
          "Exponencia o Multi de {X:mult,C:white}^.5{} até {X:mult,C:white}^3{}",
        },
      },

      j_mot_gachaJokerJ = {
        name = "Curinga gacha",
        text = {
            "Rola um curinga aleatório no final da loja por {X:money,C:white}$#1#{}",
            "A cada {C:green}#6#{} rolagem, aumenta quantas rolagens você recebe em {C:green}1{}",
            "{C:green}#2#{C:inactive} rolagens (Máx: #7#)",
            "{C:inactive} #4#/#3# pity para lendário+",
        },
      },

    },

    Spectral = {
      c_mot_bermuda = {
        name = "Bermuda",
        text = {
          "Invoca um curinga Omega,",
          "define o dinheiro como {C:money}-$20{}",
          "{C:inactive}Deve ter espaço{}"
        },
      },

      c_mot_highway = {
        name = "BR-101",
        text = {
          "Cria um Curinga",
          "{C:red,E:1}Pecaminoso{} aleatório"
        }
      }
    },
  },

  misc = {
    challenge_names = {
      c_mot_gachaC = "Gacha",
      c_mot_deadEndC = "Beco sem saída"
    },

    labels = {
      k_mot_superb = "Soberbo",
      k_mot_omega = "Omega",
    },

    dictionary = {
      k_mot_superb = "Soberbo",
      k_mot_omega = "Omega",
      k_not_enough_money = "Sem dinheiro o bastante!",
      k_not_enough_slots = "Sem espaço o bastante!",
      k_rolled = "Rolada",
      k_mot_gacha = "Rolagem Gacha!",
    },

    v_dictionary = {
      mot_stone_singular = { "+#1# Pedra" },
      mot_stone_plural = { "+#1# Pedras" },
      mot_glass_saved = { "Salvo!" },
      a_x_chips_minus = "-#1#X",
    }
  },
}
