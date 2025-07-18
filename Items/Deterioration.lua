CurrentDet = 0
MaxDet = 10
BufferRolls = 2

if SMODS.current_mod.config.deteriorationOn then 
    local SMODS_calculate_context_ref = SMODS.calculate_context
    function SMODS.calculate_context(context, return_table)
        -- your code before
        local ret = SMODS_calculate_context_ref(context, return_table)
        if context.reroll_shop then
            if CurrentDet < MaxDet and BufferRolls == 0 then CurrentDet = CurrentDet + 1 elseif BufferRolls ~= 0 then BufferRolls = BufferRolls - 1 end
            G.GAME.common_mod = .05
            G.GAME.uncommon_mod = -.02
            G.GAME.rare_mod = -.01
            G.GAME.mot_superb_mod = -.001
        end

        if context.end_of_round then
            CurrentDet = round_number(CurrentDet / 2)
        end
        return ret
    end
end