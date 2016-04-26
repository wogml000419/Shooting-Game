-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local physics = require( "physics" )
local scene = composer.newScene()

---------------------------------------------------------------------------------
local function fire()
	local temp = display.newCircle(player.x, player.y, 5)
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
		enemy1.HP = enemy1.HP - 1
		print(enemy1.HP)
		timer.cancel(event.other.timer)

		 event.other:removeSelf()
		event.other = nil
	end
end
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
	enemy1 = display.newImage(enemyGroup, "image/뒤로가기.png", display.contentCenterX, 30)

	physics.addBody(player, "dynamic", {isSensor = true})
	physics.addBody(enemy1, "dynamic")

	enemy1.HP = 100
	-- Called when the scene's view does not exist.
	--
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
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
		enemy1:addEventListener("collision", enemyCollisionDetect)
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		--
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end


function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	--
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
