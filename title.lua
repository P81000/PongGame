-- title.lua
btnPlay = {
	x = WINDOW_WIDTH / 2 - 50,
	y = WINDOW_HEIGHT / 2 - 25,
	width = 100,
	height = 50,
	text = "Play"
}

welcomeMsg = {
	text = "Pong Game",
	font = love.graphics.getFont(),
	textWidth = love.graphics.getFont():getWidth("Pong Game"),
	textHeight = love.graphics.getFont():getHeight("Pong Game")
}

function drawTitleScreen()
	love.graphics.setColor(1, 1, 1)
	love.graphics.printf(welcomeMsg.text, (WINDOW_WIDTH - welcomeMsg.textWidth) / 2, (WINDOW_HEIGHT - welcomeMsg.textHeight) / 2 - btnPlay.height - welcomeMsg.textHeight, welcomeMsg.textWidth, "center")
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill", btnPlay.x, btnPlay.y, btnPlay.width, btnPlay.height)
	love.graphics.setColor(0, 0, 0)
	love.graphics.printf(btnPlay.text, btnPlay.x, btnPlay.y + 15, btnPlay.width, "center")
end
