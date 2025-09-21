SMODS.Sound{
    key = "strong1",
    path = 'e_strong1.ogg'
}

SMODS.Sound{
    key = "strong2",
    path = 'e_strong2.ogg'
}

SMODS.Sound{
    key = "strong3",
    path = 'e_strong3.ogg'
}

SMODS.Sound{
    key = "strong4",
    path = 'e_strong4.ogg'
}

SMODS.Sound{
    key = "strong5",
    path = 'e_strong5.ogg'
}

SMODS.Sound{
    key = "strong6",
    path = 'e_strong6.ogg'
}

SMODS.Sound{
    key = "crit1",
    path = 'e_crit1.ogg'
}

SMODS.Sound{
    key = "crit2",
    path = 'e_crit2.ogg'
}

SMODS.Sound{
    key = "crit3",
    path = 'e_crit3.ogg'
}

function randomHit()
    local selected = math.random(1,6)
    return "strong" .. selected
end

function randomCrit()
    local selected = math.random(1,3)
    return "crit" .. selected
end