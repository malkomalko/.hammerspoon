hyper = hs.hotkey.modal.new({}, 'f17')

-- Setup submodes

submode_c = hs.hotkey.modal.new()
function submode_c:entered() hs.timer.doAfter(1.0, function() submode_c:exit() end) end

submode_t = hs.hotkey.modal.new()
function submode_t:entered() hs.timer.doAfter(1.0, function() submode_t:exit() end) end

local kmtriggers = {
  {'7', '4C96F528-F08E-4F44-81CA-F516D1890581'}, -- resize window [1280x720]
  {'8', 'A49395EF-AAF6-4247-8F9F-6C84FDF1AB48'}, -- resize window [custom]
  {'i', 'B56AF462-18A9-4C02-9D0E-305D440975E5'}, -- capture image to clipboard
  {'p', '4BBD139F-461A-4084-91BE-30893485865E'}, -- paste screenshot
  {'r', '9111ECFC-F12C-4A51-BDD4-8D622DE02181'}, -- quicktime screen recording
  {'s', '9973E0E2-0921-4E80-B06E-6DA79865C328'}, -- stop quicktime screen recording
  {'u', '45ED37CD-5787-48C0-B38D-E001AE207B2F'}  -- uppercase text
}

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
