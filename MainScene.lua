-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local options = {
	isModal = true,
	effect = "zoomOutInFade",
	time = 200
}

---------------------------------------------------------------------------------
local function startFunc(event)
	if event.phase == "began" then
		print("게임 시작!")
		composer.gotoScene("ShootingScene", "zoomOutInFade", 500)
	end
end

local function optionFunc(event)
	if event.phase == "began" then
		composer.showOverlay("OptionScene", options)
		print("설정")
	end
end

local function creditFunc(event)
	if event.phase == "began" then
		composer.showOverlay("CreditScene", options)
		print("Made By 한재희")
	end
end
--------------------------------------------------------------------------

--------------------------------------------------------------------------
function scene:create( event )
	local sceneGroup = self.view

	start = display.newText(sceneGroup, "게임 시작", display.contentCenterX, display.contentCenterY)
	optionButton = display.newText(sceneGroup, "설정", display.contentCenterX, display.contentHeight * (2/3))
	creditButton = display.newText(sceneGroup, "제작자", display.contentCenterX, display.contentHeight * (5/6))

	start:addEventListener("touch", startFunc)
	optionButton:addEventListener("touch", optionFunc)
	creditButton:addEventListener("touch", creditFunc)

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
