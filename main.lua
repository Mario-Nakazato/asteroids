function love.load(arg)

  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Debug para ZeroBrane Studio IDE Utilize; Argumento - arg esta disponivel global.
  
  --[[
    Reaparece com o angulo que morreu
    Fogo da propulsão
    Hiperespaço com um tempo de parecimento
    180
  ]]--

  update = true

  tela = {}
  tela.c, tela.l = love.graphics.getDimensions()

  pixelPorMetro = 64
  gx, gy = pixelPorMetro *0, pixelPorMetro *0
  
  love.physics.setMeter(pixelPorMetro)
  espaco = love.physics.newWorld(gx, gy, true)
  --espaco:setCallbacks(inicioContato, fimContato, preContato, posContato)
  
  nave = {}

  nave.x = tela.c /2
  nave.y = tela.l /2
  nave.tipo = "dynamic"
  nave.modo = "line"
  nave.velMax = pixelPorMetro *8
  nave.forca = pixelPorMetro *16
  nave.w = math.pi *1

  nave.corpo = love.physics.newBody(espaco, nave.x, nave.y, nave.tipo)
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

    if direita then
      self.corpo:setAngle(self.corpo:getAngle() +self.w *dt)
    end
    if esquerda then
      self.corpo:setAngle(self.corpo:getAngle() -self.w *dt)
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

end

function love.update(dt)
  
  if not update then
    return
  end

  nave:update(dt)
  espaco:update(dt)
  
end

function love.draw()

  nave:draw()
  
end

function love.keypressed(tecla, cod, repeticao)
  
  if tecla == "f5" then
    love.load(arg)
  elseif tecla == "f1" then
    update = not update
  end

  nave:keypressed(tecla)
  
end

function love.keyreleased(tecla, cod)
  
  nave:keyreleased(tecla)
  
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

function inicioContato(a, b, contato)
  
  
  
end

function fimContato(a, b, contato)
  
  
  
end

function preContato(a, b, contato)
  
  
  
end

--function posContato(a, b, contato, normalImpulso, tangenteImpulso, normalImpulso1, tangenteImpulso1)
function posContato(a, b, contato, normalImpulso, tangenteImpulso)
  
  
  
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