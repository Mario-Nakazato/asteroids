--[[
    um pseudo orientação a objetos falta muitos detalhes para corrir como sets e gets e atributos privados etc por agr é funciona
    variaveis como foguete, direita e esquerda precisam ser reavaliadas sendo somente sendo funcionais
]]--

local function novo(mundo, x, y)

    local nave = {}

    nave.x = x
    nave.y = y
    nave.tipo = "dynamic"
    nave.modo = "line"
    nave.velMax = love.physics.getMeter() *16
    nave.forca = love.physics.getMeter() *16
    nave.w = math.pi *1

    nave.corpo = love.physics.newBody(mundo, nave.x, nave.y, nave.tipo)
    nave.forma = love.physics.newPolygonShape({32, 0, -23, -23, -23, 23})
    --nave.forma = love.physics.newCircleShape(32)
    nave.fixar = love.physics.newFixture(nave.corpo, nave.forma)

    nave.corpo:setMass(1)
    --nave.corpo:setAngle(-math.pi /2)
    nave.corpo:setLinearDamping(0.32)

    function nave:update(dt)

        if self.corpo:getX() < 0 then
            self.corpo:setX(tela.c)
        elseif self.corpo:getX() > tela.c then
            self.corpo:setX(0)
        end
        if self.corpo:getY() < 0 then
            self.corpo:setY(tela.l)
        elseif self.corpo:getY() > tela.l then
            self.corpo:setY(0)
        end

        if foguete then
            local velx, vely = self.corpo:getLinearVelocity()
            if math.sqrt(velx^2 +vely ^2) <= nave.velMax then
                self.corpo:applyForce(self.forca *math.cos(self.corpo:getAngle()), self.forca *math.sin(self.corpo:getAngle()))
            end
        end

        if direita and not esquerda then
            --self.corpo:setAngle(self.corpo:getAngle() +self.w *dt)
            self.corpo:setAngularVelocity(self.w)
        elseif esquerda and not direita then
            --self.corpo:setAngle(self.corpo:getAngle() -self.w *dt)
            self.corpo:setAngularVelocity(-self.w)
        else
            self.corpo:setAngularVelocity(0)
        end

    end

    function nave:draw()

        --love.graphics.push("all")
        love.graphics.push()
        --love.graphics.circle(self.modo, self.corpo:getX(), self.corpo:getY(), 32)
        love.graphics.polygon(self.modo, self.corpo:getWorldPoints(self.forma:getPoints()))
        love.graphics.pop()

    end

    function nave:keypressed(tecla)

        if tecla == "w" then
            foguete = true
        elseif tecla == "s" then
            self.corpo:setAngle(self.corpo:getAngle() -math.pi)
        end

        if tecla == "d" then
            direita = true
            --esquerda = false
        elseif tecla == "a" then
            esquerda = true
            --direita = false
        end

    end

    function nave:keyreleased(tecla)

        if tecla == "w" then
            foguete = false
        end

        if tecla == "d" then
            direita = false
        elseif tecla == "a" then
            esquerda = false
        end

    end

    return nave

  end

nave = {

    novo = novo,

}

return nave