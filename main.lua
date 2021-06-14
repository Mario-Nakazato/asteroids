require("classe/mundo")
require("classe/nave")

--[[
    Inicio de poo ainda com falta de recursos
    Reaparece com o angulo que morreu
    Fogo da propulsão
    Hiperespaço com um tempo de parecimento
    180
]]--

function love.load(arg)

    if arg[#arg] == "-debug" then require("mobdebug").start() end -- Debug para ZeroBrane Studio IDE Utilize; Argumento - arg esta disponivel global.

    math.randomseed(os.time())
    
    update = true

    tela = {}
    tela.c, tela.l = love.graphics.getDimensions()

    espaco = mundo.novo(64, 0, 0)
    nv = nave.novo(espaco, tela.c /2, tela.l /2)
    nv.fixar:setUserData("nave")

    nAsteroides = 8
    asteroides = {}

    for i = 1, nAsteroides do

        asteroides[i] = {}
        asteroides[i].x = math.random(0, tela.c)
        asteroides[i].y = math.random(0, tela.l)
        asteroides[i].r = math.random(16, 64)
        asteroides[i].tipo = "dynamic"
        asteroides[i].modo = "line"
        asteroides[i].vel = math.random(love.physics.getMeter(), love.physics.getMeter() *8)
        
        asteroides[i].corpo = love.physics.newBody(espaco, asteroides[i].x, asteroides[i].y, asteroides[i].tipo)
        --asteroides[i].forma = love.physics.newPolygonShape({32, 0, -23, -23, -23, 23})
        asteroides[i].forma = love.physics.newCircleShape(asteroides[i].r)
        asteroides[i].fixar = love.physics.newFixture(asteroides[i].corpo, asteroides[i].forma)
        
        asteroides[i].corpo:setMass(1)
        asteroides[i].corpo:setAngle(math.random(0, math.pi *2))
        asteroides[i].corpo:setFixedRotation(true)
        
        asteroides[i].fixar:setCategory(2)
        asteroides[i].fixar:setMask(2)

        asteroides[i].update = function(self, dt)

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
    
            self.corpo:setLinearVelocity(self.vel *math.cos(self.corpo:getAngle()), self.vel *math.sin(self.corpo:getAngle()))
    
        end
    
        asteroides[i].draw = function(self)
    
            love.graphics.push()
            love.graphics.circle(self.modo, self.corpo:getX(), self.corpo:getY(), self.forma:getRadius())
            --love.graphics.polygon(self.modo, self.corpo:getWorldPoints(self.forma:getPoints()))
            love.graphics.pop()
    
        end

    end

end

function love.update(dt)

    if not update then
        return
    end

    nv:update(dt)
    --asteroide:update(dt)
    for c, v in pairs(asteroides) do -- Faz parte do Z garantir a ideia de terceira dimensão. Seve ser melhorado.
        v:update(dt)
    end
    espaco:update(dt)

end

function love.draw()

    for i = -1, 1 do
        for j = -1, 1 do
            love.graphics.origin()
            love.graphics.translate(i *tela.c, j *tela.l)
            nv:draw()
            --asteroide:draw()
            for c, v in pairs(asteroides) do -- Faz parte do Z garantir a ideia de terceira dimensão. Seve ser melhorado.
                v:draw()
            end
        end
    end
    love.graphics.origin()

end

function love.keypressed(tecla, cod, repeticao)

    if tecla == "f5" then
        love.load(arg)
     elseif tecla == "f1" then
        update = not update
    end

    nv:keypressed(tecla)

end

function love.keyreleased(tecla, cod)

    nv:keyreleased(tecla)

end

function inicioContato(a, b, contato)

    print(a, b, contato, contato, a:getUserData(), b:getUserData())

end

function fimContato(a, b, contato)



end

function preContato(a, b, contato)



end

--function posContato(a, b, contato, normalImpulso, tangenteImpulso, normalImpulso1, tangenteImpulso1)
function posContato(a, b, contato, normalImpulso, tangenteImpulso)



end

--[[
function love.mousepressed(x, y, botao, toque, repeticao)



end

function love.mousereleased(x, y, botao, toque, repeticao)



end

function love.mousemoved(x, y, dx, dy, toque)



end

function love.wheelmoved(x, y)



end

function love.mousefocus(foco)



end

function love.resize(c, l)



end

function love.focus(foco)



end

function love.quit()



end

function love.touchpressed(id, x, y, dx, dy, pressao)



end

function love.touchreleased(id, x, y, dx, dy, pressao)



end

function love.touchmoved(id, x, y, dx, dy, pressao)



end

function love.displayrotated(indice, orientacao)



end

function love.textedited(texto, inicio, tamanho)



end

function love.textinput(texto)



end

function love.directorydropped(caminho)



end

function love.filedropped(arquivo)



end

function love.errorhandler(erro)



end

function love.lowmemory()



end

function love.threaderror(thread, erro)



end

function love.visible(visivel)-- Esta funcao CallBack não funciona, utilize visivel = love.window.isMinimized()
end
--]]