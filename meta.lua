
-- G.PROFILES[G.SETTINGS.profile]

-- Does not handle nested keys
local META_DEFAULT = {
    gold_egg_chips = 0,
}


function set_meta(key, value)
    G.PROFILES[G.SETTINGS.profile][key] = value
end

function get_meta(key)
    if not G.PROFILES[G.SETTINGS.profile][key] then G.PROFILES[G.SETTINGS.profile][key] = META_DEFAULT[key] end
    return G.PROFILES[G.SETTINGS.profile][key]
end

function reset_meta()
    for key, value in pairs(META_DEFAULT) do
        G.PROFILES[G.SETTINGS.profile][key] = value
    end
end

