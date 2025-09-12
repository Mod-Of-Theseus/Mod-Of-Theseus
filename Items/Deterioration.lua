local original_start_run = G.start_run

function Game:start_run(args)
    original_start_run(args)

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

if SMODS.current_mod.config.deteriorationOn then 
    local SMODS_calculate_context_ref = SMODS.calculate_context
    function SMODS.calculate_context(context, return_table)
        -- your code before
        local ret = SMODS_calculate_context_ref(context, return_table)
        if context.reroll_shop then
            if G.GAME.current_det < G.GAME.max_det and G.GAME.buffer_rerolls == 0 then
                ease_deterioration(1) 
            elseif G.GAME.buffer_rerolls ~= 0 then
                G.GAME.buffer_rerolls = G.GAME.buffer_rerollsferRolls - 1
            end
            G.GAME.common_mod = .05
            G.GAME.uncommon_mod = -.02
            G.GAME.rare_mod = -.01
            G.GAME.mot_superb_mod = -.001
        end

        if context.end_of_round then
            G.GAME.current_det = round_number(G.GAME.current_det / 2)
        end
        return ret
    end
end