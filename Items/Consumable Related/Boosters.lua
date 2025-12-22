--[[ Uncomment the below when the music is ready.

SMODS.Sound({
	key = "music_theseus_pack",
	path = "music_placeholder.ogg",
    select_music_track = function()
        local card = G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1]
        return card and card.ability and card.ability.set == "Theseus"
    end
}) 

]]

for i = 1, 2 do -- i'm going to assume there will be graphics for the Theseus packs. so I use this loop to make two types
    SMODS.Booster{
        key = 'theseus_pack' .. i,
        loc_txt = {
            name = 'Theseus Pack',
            group_name = "Theseus Pack",
    		text = {
    			'Choose {C:attention}#1#{} of up to',
    			'{C:attention}#2# {C:tarot}Theseus{} cards to',
    			'be used immediately',
    		}
        },
        atlas = 'PLH',
        pos = { x = 0 + i, y = 0 },
        -- weight = 0.5,
        weight = 0.0, -- Disable while WIP
        cost = 4,
    	create_card = function()
    		return create_card("Theseus", G.pack_cards, nil, nil, true, true, nil, "mot_theseus")
    	end,
	    ease_background_colour = function()
		ease_background_colour({ new_colour = G.C.BLUE, special_colour = G.C.BLACK, contrast = 2 })
	end,
    }
end

for i = 1, 2 do
    SMODS.Booster{
        key = "sinful_normal_" .. i,
        atlas = "BoostersP",
        group_key = "k_mot_sinful_pack",
        pos = { x = 0 + (i-1), y = 0 },
        config = {extra = 3, choose = 1},
        cost = 4,
        kind = "Sinful",
        weight = 0.5,
        create_card = function(self, card)
            return create_card("sinfulPool", G.pack_cards, true, true, true, "mot", nil)
        end,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra },
                key = self.key:sub(1, -3)
            }
        end,
    }
end

SMODS.Booster{
    key = "sinful_jumbo",
    atlas = "BoostersP",
    group_key = "k_mot_sinful_pack",
    pos = { x = 2, y = 0 },
    config = {extra = 5, choose = 1},
    cost = 8,
    kind = "sinful",
    weight = 0.5,
    create_card = function()
        return create_card("sinfulPoolFull", G.pack_cards, true, true, true, "mot", nil)
    end,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {vars = {cfg.choose, cfg.extra },}
    end,
}

SMODS.Booster{
    key = "sinful_mega",
    atlas = "BoostersP",
    group_key = "k_mot_sinful_pack",
    pos = { x = 3, y = 0 },
    config = {extra = 5, choose = 2},
    cost = 8,
    kind = "sinful",
    weight = 0.5,
    create_card = function()
        return create_card("sinfulPoolFull", G.pack_cards, true, true, true, "mot", nil)
    end,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {vars = {cfg.choose, cfg.extra },}
    end,
}