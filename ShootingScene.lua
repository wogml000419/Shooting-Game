-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local physics = require( "physics" )
local enemy = require( "enemy" )
local scene = composer.newScene()

---------------------------------------------------------------------------------
local function fire()																												--총알 발사 함수
	local temp = display.newCircle(player.x, player.y, 5)											--플레이어 위치에 총알 생성
	physics.addBody(temp, "dynamic", {radius = temp.radius, isSensor = true})
	temp.isBullet = true
	temp:setLinearVelocity(0, -400)
	temp.id = "bullet"
	bulletGroup:insert(temp)
	temp.timer = timer.performWithDelay(6000, function()
		physics.removeBody(temp)
		temp:removeSelf()
		temp = nil
		end)
end

local function moveCharacter( event )
	print(event.x, event.y)
	player.x = event.x
	player.y = event.y
end

local function enemyCollisionDetect( event )
	if event.phase == "began" then
		if event.other.id == "bullet" then
		event.target.HP = event.target.HP - 1
		print(event.target.HP)
		timer.cancel(event.other.timer)
		event.other:removeSelf()
		event.other = nil
		end
	end
end

local function allMoving( event )
	enemy1:moving( 180, 3 )
	enemy2:moving( 180, 2 )
	enemy3:moving( 180, 1 )
end
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
function scene:create( event )
	local sceneGroup = self.view

	physics.start()
	physics.setGravity(0, 0)
	physics.setDrawMode("hybrid")

	bgGroup = display.newGroup()
	playerGroup = display.newGroup()
	bulletGroup = display.newGroup()
	UIGroup = display.newGroup()
	enemyGroup = display.newGroup()

	sceneGroup:insert(bgGroup)
	sceneGroup:insert(enemyGroup)
	sceneGroup:insert(playerGroup)
	sceneGroup:insert(bulletGroup)
	sceneGroup:insert(UIGroup)

	player = display.newImage(playerGroup, "image/Icon-60.png", display.contentCenterX, display.contentCenterY)
	physics.addBody(player, "dynamic", {isSensor = true})
	player.canMove = true

	enemy1 = enemy.New(enemyGroup, "image/뒤로가기.png", display.contentCenterX, 30)
	enemy1:makeBody()
	enemy1.HP = 100

	enemy2 = enemy.New(enemyGroup, "image/뒤로가기.png", display.contentWidth * (1/4), 30)
	enemy2:makeBody()
	enemy2.HP = 100

	enemy3 = enemy.New(enemyGroup, "image/뒤로가기.png", display.contentWidth * (3/4), 30)
	enemy3:makeBody()
	enemy3.HP = 100
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		physics.start()
		physics.setGravity(0, 0)
		physics.setDrawMode("hybrid")

		Runtime:addEventListener("enterFrame", fire)
		Runtime:addEventListener("touch", moveCharacter)
		Runtime:addEventListener("enterFrame", allMoving)

		enemy1.resource:addEventListener("collision", enemyCollisionDetect)
		enemy2.resource:addEventListener("collision", enemyCollisionDetect)
		enemy3.resource:addEventListener("collision", enemyCollisionDetect)

	elseif phase == "did" then

	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then

	elseif phase == "did" then

	end
end


function scene:destroy( event )
	local sceneGroup = self.view

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
