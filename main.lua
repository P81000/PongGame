-- main.lua
WINDOW_WIDTH = 800 
WINDOW_HEIGHT = 600 

SCREEN_TITLE = 1
SCREEN_GAME = 2

currentScreen = SCREEN_TITLE

player1score = 0
player2score = 0

function love.load()
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
	love.window.setTitle("Pong Game")

	require("title")
	require("game")
end

function love.draw()
	if currentScreen == SCREEN_TITLE then
		drawTitleScreen()
	elseif currentScreen == SCREEN_GAME then
		drawGameScreen(player1score, player2score)
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 and currentScreen == SCREEN_TITLE then
		if x > btnPlay.x and x < btnPlay.x + btnPlay.width and y > btnPlay.y and y < btnPlay.y + btnPlay.height then
			currentScreen = SCREEN_GAME
		end
	end
end
