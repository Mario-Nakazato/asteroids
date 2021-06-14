--[[

    poo funcional

]]--

local function novo(pixelPorMetro, gx, gy)

    love.physics.setMeter(pixelPorMetro)
    local classe = love.physics.newWorld(pixelPorMetro *gx, pixelPorMetro *gy, true)
    --classe:setCallbacks(inicioContato, fimContato, preContato, posContato)

    return classe

end

mundo = {

    novo = novo

}
    
return mundo