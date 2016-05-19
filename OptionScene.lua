-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
local function returnFunc( event ) --옵션창을 종료하는 함수
	if event.phase == "began" then
		print("오버레이 종료")
		composer.hideOverlay(false, "zoomOutInFade", 200)
	end
end

local function bgmUp( event )
	local BGM = composer.getVariable("BGM") --볼륨을 1씩 올리는 함수
  if BGM < 100 then			  --누르고 있을 경우 계속 실행
  	BGM = BGM + 1
  	BGMval.text = BGM
		composer.setVariable("BGM", BGM)
	end
end

local function bgm10Up( event ) --볼륨을 10씩 올리는 함수
	local BGM = composer.getVariable("BGM")
	if event.phase == "began" then --한 번 터치마다 한 번씩 실행
 		if BGM < 91 then
  		BGM = BGM + 10
  		BGMval.text = BGM
			composer.setVariable("BGM", BGM)
		else
			BGM = 100
			BGMval.text = BGM
			composer.setVariable("BGM", BGM)
		end
	end
end

local function bgmDown( event ) --볼륨을 1씩 내리는 함수
	local BGM = composer.getVariable("BGM")
	if BGM > 0 then				--누르고 있을 경우 계속 실행
		BGM = BGM - 1
		BGMval.text = BGM
		composer.setVariable("BGM", BGM)
	end
end

local function bgm10Down( event ) --볼륨을 10씩 내리는 함수
	local BGM = composer.getVariable("BGM")
	if event.phase == "began" then --한 번 터치마다 한 번씩 실행
		if BGM > 9 then
			BGM = BGM - 10
			BGMval.text = BGM
			composer.setVariable("BGM", BGM)
		else
			BGM = 0
			BGMval.text = BGM
			composer.setVariable("BGM", BGM)
		end
	end
end
---------------------------------------------------------------------------------
function scene:create( event )
  local sceneGroup = self.view
--[[ 이미지 불러옴 ]]
  background = display.newImage(sceneGroup, "image/배경.png", display.contentCenterX, display.contentCenterY)
  returnImage = display.newImage(sceneGroup, "image/뒤로가기.png", display.contentWidth - 50, display.contentHeight - 50)
  up = display.newImage(sceneGroup, "image/up.png", display.contentCenterX + 15, display.contentHeight * (1/20))
  upx10 = display.newImage(sceneGroup, "image/upx10.png", display.contentCenterX + 30, display.contentHeight * (1/20))
  down = display.newImage(sceneGroup, "image/down.png", display.contentCenterX - 15, display.contentHeight * (1/20))
  downx10 = display.newImage(sceneGroup, "image/downx10.png", display.contentCenterX - 30, display.contentHeight * (1/20))

--[[텍스트 띄움]]
	BGMval = display.newText(sceneGroup, composer.getVariable("BGM"), display.contentCenterX, display.contentHeight * (1/20))
	BGMtext = display.newText(sceneGroup, "BGM", display.contentWidth * (1/10), display.contentHeight * (1/20))
	BGMval:setFillColor(0, 0, 0)
	BGMtext:setFillColor(0, 0, 0)

--[[이벤트리스너]]
  returnImage:addEventListener("touch", returnFunc)
  up:addEventListener("touch", bgmUp)
  upx10:addEventListener("touch", bgm10Up)
  down:addEventListener("touch", bgmDown)
  downx10:addEventListener("touch", bgm10Down)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then

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

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
