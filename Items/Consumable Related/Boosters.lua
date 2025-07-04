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
