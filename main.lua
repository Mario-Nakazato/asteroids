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

  update = true

  tela = {}
  tela.c, tela.l = love.graphics.getDimensions()

  espaco = mundo.novo(64, 0, 0)
  
  nv = nave.novo(espaco, tela.c /2, tela.l /2)

end

function love.update(dt)
  
  if not update then
    return
  end

  nv:update(dt)
  espaco:update(dt)
  
end

function love.draw()

  for i = -1, 1 do
    for j = -1, 1 do
      love.graphics.origin()
      love.graphics.translate(i *tela.c, j *tela.l)
      nv:draw()
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