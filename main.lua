-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local tap_count =0

local background_img= display.newImageRect("brick.jpg",360,570)

background_img.x = display.contentCenterX
background_img.y = display.contentCenterY

local score_text = display.newText(tap_count,display.contentCenterX-80,15,native.systemFont,30)

local rod_img = display.newImageRect("rod.jpg",360,50)

rod_img.x = display.contentCenterX
rod_img.y = display.contentHeight-15

local ball_img = display.newImageRect("ball2.png",120,120)

ball_img.x = display.contentCenterX
ball_img.y = display.contentCenterY

local physics = require("physics")

physics.start()

physics.addBody(ball_img,"dynamic",{radius = 50,bounce = 0.8})

physics.addBody(rod_img,"static")

local function pushBallUp()

ball_img:applyLinearImpulse(0,-0.60,ball_img.x,ball_img.y)

tap_count = tap_count+1
score_text.text = tap_count
end

ball_img:addEventListener("tap",pushBallUp)
