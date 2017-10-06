hyper = hs.hotkey.modal.new({}, 'f17')

-- Setup submodes

submode_c = hs.hotkey.modal.new()
function submode_c:entered() hs.timer.doAfter(1.0, function() submode_c:exit() end) end

submode_t = hs.hotkey.modal.new()
function submode_t:entered() hs.timer.doAfter(1.0, function() submode_t:exit() end) end

-- Bind the hyper key

function pressedF18()
  hyper.triggered = false
  hyper:enter()
end

function releasedF18()
  hyper:exit()
end

f19 = hs.hotkey.bind({}, 'f18', pressedF18, releasedF18)

-- Bind submodes

hyper:bind({}, 'c', function() submode_c:enter() end)
hyper:bind({}, 't', function() submode_t:enter() end)
