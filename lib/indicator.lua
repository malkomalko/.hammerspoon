local blue = { hex = "2B4653", alpha = 1.0 }
local green = { hex = "3FDDB0", alpha = 1.0 }
local red = { hex = "FF5E50", alpha = 1.0 }
local yellow = { hex = "F4E847", alpha = 1.0 }

local indicator_alpha = 1
local indicator_height = 5

function timer_indicator(timelen)
  if not indicator_used then
    indicator_used = hs.drawing.rectangle({ 0, 0, 0, 0 })
    indicator_used:setStroke(false)
    indicator_used:setFill(true)
    indicator_used:setFillColor(red)
    indicator_used:setAlpha(indicator_alpha)
    indicator_used:setLevel(hs.drawing.windowLevels.status)
    indicator_used:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces + hs.drawing.windowBehaviors.stationary)
    indicator_used:show(running)

    indicator_left = hs.drawing.rectangle({ 0, 0, 0, 0 })
    indicator_left:setStroke(false)
    indicator_left:setFill(true)
    indicator_left:setFillColor(green)
    indicator_left:setAlpha(indicator_alpha)
    indicator_left:setLevel(hs.drawing.windowLevels.status)
    indicator_left:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces + hs.drawing.windowBehaviors.stationary)
    indicator_left:show()

    totaltime = timelen
    if totaltime > 45 * 60 then
      time_interval = 5
    else
      time_interval = 1
    end
    if indict_timer == nil then
      indict_timer = hs.timer.doEvery(time_interval, updateused)
    else
      indict_timer:start()
    end
    used_slice = 0
  else
    indict_timer:stop()
    indicator_used:delete()
    indicator_used = nil
    indicator_left:delete()
    indicator_left = nil
  end

  submode_t:exit()
end

function toggle_timer()
  if indict_timer ~= nil then
    if indict_timer:running() then
      indict_timer:stop()
    else
      indict_timer:start()
    end
  end
end

function updateused()
  local mainScreen = hs.screen.mainScreen()
  local mainRes = mainScreen:fullFrame()
  local timeslice = mainRes.w / (60 * totaltime / time_interval)
  used_slice = used_slice + timeslice * time_interval
  if used_slice > mainRes.w then
    indict_timer:stop()
    indicator_used:delete()
    indicator_used = nil
    indicator_left:delete()
    indicator_left = nil

    local message = totaltime .. " minute timer ended √"
    hs.alert(message, {}, hs.screen.mainScreen(), 2.0)
  else
    left_slice = mainRes.w - used_slice
    local used_rect = hs.geometry.rect(0, mainRes.h - indicator_height, used_slice, indicator_height)
    local left_rect = hs.geometry.rect(used_slice, mainRes.h - indicator_height, left_slice, indicator_height)
    indicator_used:setFrame(used_rect)
    indicator_left:setFrame(left_rect)
  end
end

submode_t:bind('', '1', '1 minute countdown', function() timer_indicator(1) end)
submode_t:bind('', '2', '2 minute countdown', function() timer_indicator(2) end)
submode_t:bind('', '3', '3 minute countdown', function() timer_indicator(3) end)
submode_t:bind('', '4', '4 minute countdown', function() timer_indicator(4) end)
submode_t:bind('', '5', '5 minute countdown', function() timer_indicator(5) end)
submode_t:bind('', '6', '6 minute countdown', function() timer_indicator(6) end)
submode_t:bind('', '7', '7 minute countdown', function() timer_indicator(7) end)
submode_t:bind('', '8', '8 minute countdown', function() timer_indicator(8) end)
submode_t:bind('', '9', '9 minute countdown', function() timer_indicator(9) end)
submode_t:bind('', '0', '10 minute countdown', function() timer_indicator(10) end)

submode_t:bind('', 'escape', function() submode_t:exit() end)
submode_t:bind('', 'q', function() submode_t:exit() end)
submode_t:bind('', 't', '25 minute countdown', function() timer_indicator(25) end)
submode_t:bind('', 'space', 'toggle timer', function() toggle_timer() end)
