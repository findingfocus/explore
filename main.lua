push = require 'push'

Class = 'class'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 800

VIRTUAL_WIDTH = 600
VIRTUAL_HEIGHT = 375

PLAYER_SPEED = 100

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	largeFont = love.graphics.newFont('BTTF.ttf', 50)
	love.graphics.setFont(largeFont)
	love.window.setTitle('Explore')

	sounds = {
		['titleMusic'] = love.audio.newSource('music/MartysLetter.mp3', 'static'),
		['playMusic'] = love.audio.newSource('music/Gigawatts.mp3', 'static')
	}

	sounds['titleMusic']:setLooping(true)
	sounds['titleMusic']:play()

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = true,
		resizable = false,
	})

	Player1:reset()

	PLAYER_SPEED = 300



end

function love.update(dt)
	if love.keyboard.isDown('up') then
		player1Y = math.max(0, player1Y + -PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('down') then
		player1Y = math.min(VIRTUAL_HEIGHT - 40, player1Y + PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('left') then
		player1X = math.max(0, player1X - PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('right') then
		player1X = math.min(VIRTUAL_WIDTH - 40, player1X + PLAYER_SPEED * dt)
	end
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end


function love.draw()
	push:apply('start')
	love.graphics.clear(56/255,140/255,180/255, 111/255)
	love.graphics.setFont(largeFont)
	love.graphics.printf('Back to the Future', 0, 20, VIRTUAL_WIDTH, 'center')
	love.graphics.setColor(0/255, 0/255, 255/255, 255/255)
	love.graphics.rectangle('fill', player1X, player1Y, 40, 40)



	push:apply('end')
end
