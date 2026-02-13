local original_start_run = G.start_run

function Game:start_run(args)
    original_start_run(self, args)
    if not args.savetext then --new save
        G.GAME.current_det = 0
        G.GAME.max_det = 10
        G.GAME.buffer_rerolls = 2

        G.GAME.planet_default = G.GAME.planet_rate -- Should be 4
        G.GAME.tarot_default = G.GAME.tarot_rate -- Should be 4
        G.GAME.det_tarot_default = G.GAME.det_tarot_rate -- Should be .4
        G.GAME.det_planet_default = G.GAME.det_planet_rate -- Should be .4

        for _, hand in pairs(G.GAME.hands) do
            hand.original_l_mult = hand.l_mult
            hand.original_l_chips = hand.l_chips
        end
    end
end

function ease_deterioration(mod)
    G.GAME.current_det = G.GAME.current_det + mod
end

function roundToZero(num)
    if math.abs(num) < 1e-3 then
        return 0
    else
        return num
    end
end

SMODS.current_mod.calculate = function(self, context)
    if self.config.deterioration == false then return end
    if context.reroll_shop then
        if G.GAME.current_det < G.GAME.max_det and G.GAME.buffer_rerolls == 0 then
            ease_deterioration(1) 
        elseif G.GAME.buffer_rerolls ~= 0 then
            G.GAME.buffer_rerolls = G.GAME.buffer_rerolls - 1
        end

        G.GAME.uncommon_mod = math.max(G.GAME.uncommon_mod - .1, 0)
        G.GAME.rare_mod = math.max(G.GAME.rare_mod - .20, 0)
        G.GAME.mot_superb_mod = math.max(G.GAME.mot_superb_mod - .33,0)

        G.GAME.det_tarot_rate = math.min(G.GAME.det_tarot_rate + .5, 4)
        G.GAME.tarot_rate = roundToZero(math.max(G.GAME.tarot_rate - .5, 0))

        G.GAME.det_planet_rate = math.min(G.GAME.det_planet_rate + .5, 4)
        G.GAME.planet_rate = roundToZero(math.max(G.GAME.planet_rate - .5, 0))

    end

    if context.end_of_round then
        G.GAME.current_det = 0
        G.GAME.buffer_rerolls = 2

        G.GAME.common_mod = 1
        G.GAME.uncommon_mod = 1
        G.GAME.rare_mod = 1
        G.GAME.mot_superb_mod = 1

        G.GAME.tarot_rate = G.GAME.tarot_default
        G.GAME.planet_rate = G.GAME.planet_default
        
        G.GAME.det_planet_rate = G.GAME.det_planet_default
        G.GAME.det_tarot_rate = G.GAME.det_tarot_default
    end

    if context.using_consumeable and context.consumeable.ability.set == "Planet" then
        G.GAME.hands[context.consumeable.ability.hand_type].l_mult = G.GAME.hands[context.consumeable.ability.hand_type].original_l_mult
        G.GAME.hands[context.consumeable.ability.hand_type].l_chips = G.GAME.hands[context.consumeable.ability.hand_type].original_l_chips
    end
end