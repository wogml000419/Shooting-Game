--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local function returnFunc( event )
	if event.phase == "began" then
		print("오버레이 종료")
		composer.hideOverlay(false, "zoomOutInFade", 200)
	end
end
---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	background = display.newImage(sceneGroup, "image/배경.png", display.contentCenterX, display.contentCenterY)
	creditText = display.newText(sceneGroup, "Created by 한재희 in", display.contentCenterX, display.contentCenterY -30)
	creditText:setFillColor(0, 0, 0)
	credimage = display.newImage(sceneGroup, "image/제작자.png", display.contentCenterX, display.contentCenterY + 30)
	returnImage = display.newImage(sceneGroup, "image/뒤로가기.png", display.contentWidth - 50, display.contentHeight - 50)

	returnImage:addEventListener("touch", returnFunc)
	-- Called when the scene's view does not exist.
	--
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
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
