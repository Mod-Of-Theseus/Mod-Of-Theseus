local original_start_run = G.start_run

function Game:start_run(args)
    original_start_run(self, args)
    if not args.savetext then --new save
        G.GAME.current_det = 0
        G.GAME.max_det = 10
        G.GAME.buffer_rerolls = 2
    end
end

function ease_deterioration(mod)
    G.GAME.current_det = G.GAME.current_det + mod
    print(G.GAME.current_det)
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

    end

    if context.end_of_round then
        G.GAME.current_det = 0
        G.GAME.common_mod = 1
        G.GAME.uncommon_mod = 1
        G.GAME.rare_mod = 1
        G.GAME.mot_superb_mod = 1
    end
end