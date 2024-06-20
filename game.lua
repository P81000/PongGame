-- game.lua
math.randomseed(os.time())

local directionX = math.random() > 0.5 and 120 or -120  
local directionY = math.random(-120, 120)

local ball = {
	x = WINDOW_WIDTH / 2 - 2,
	y = WINDOW_HEIGHT / 2 - 2,
	width = 8,
	height = 8,
	dx = directionX,
	dy = directionY 
}

local player1 = {
	x = 10,
	y = WINDOW_HEIGHT / 2 - 30,
	width = 20,
	height = 60,
	speed = 200
}

local player2 = {
	x = WINDOW_WIDTH - 30,
	y = WINDOW_HEIGHT / 2 - 30,
	width = 20,
	height = 60,
	speed = 200
}

function checkCollision(a, b)
	return a.x < b.x + b.width and
	a.x + a.width > b.x and
	a.y < b.y + b.height and
	a.y + a.height > b.y
end

function resetBall()
	ball.x = WINDOW_WIDTH / 2 - 2
	ball.y = WINDOW_HEIGHT / 2 - 2
	ball.dx = math.random() > 0.5 and 120 or -120  -- Define uma nova direção horizontal aleatória
	ball.dy = math.random(-120, 120)  -- Define uma nova direção vertical aleatória
end

function love.update(dt)
	ball.x = ball.x + ball.dx * dt
	ball.y = ball.y + ball.dy * dt

	-- Verifica colisão com as paredes
	if ball.y <= 0 or ball.y >= WINDOW_HEIGHT - ball.height then
		ball.dy = -ball.dy
	end

	-- Verifica colisão com os jogadores
	if checkCollision(ball, player1) or checkCollision(ball, player2) then
		ball.dx = -ball.dx
	end

	-- Verifica se a bola saiu pelos lados
	if ball.x < 0 then
		player2score = player2score + 1
		resetBall()
	elseif ball.x > WINDOW_WIDTH then
		player1score = player1score + 1
		resetBall()
	end

	-- Movimenta os jogadores
	if love.keyboard.isDown("w") and player1.y > 0 then
		player1.y = player1.y - player1.speed * dt
	elseif love.keyboard.isDown("s") and player1.y < WINDOW_HEIGHT - player1.height then
		player1.y = player1.y + player1.speed * dt
	end

	if love.keyboard.isDown("up") and player2.y > 0 then
		player2.y = player2.y - player2.speed * dt
	elseif love.keyboard.isDown("down") and player2.y < WINDOW_HEIGHT - player2.height then
		player2.y = player2.y + player2.speed * dt
	end
end

function drawGameScreen(player1score, player2score)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)

	love.graphics.rectangle("fill", player1.x, player1.y, player1.width, player1.height)
	love.graphics.rectangle("fill", player2.x, player2.y, player2.width, player2.height)

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Player 1: " .. player1score, 20, 20)
	love.graphics.print("Player 2: " .. player2score, WINDOW_WIDTH - 120, 20)
end
