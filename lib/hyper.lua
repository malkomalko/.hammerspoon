hyper = hs.hotkey.modal.new({}, 'f17')
hyperchord = {'cmd','alt','shift','ctrl'}

-- Setup submodes

submode_c = hs.hotkey.modal.new()
function submode_c:entered() hs.timer.doAfter(1.0, function() submode_c:exit() end) end

submode_k = hs.hotkey.modal.new()
function submode_k:entered() hs.timer.doAfter(1.0, function() submode_k:exit() end) end

submode_t = hs.hotkey.modal.new()
function submode_t:entered() hs.timer.doAfter(1.0, function() submode_t:exit() end) end

-- Keybindings

local hyperBindings = {
  'a','b','c','d','e','f','g','h','i','j',
  'k','l','m','n','o','p','q','r','s','t',
  'u','v','w','x','y','z','space','tab',
  '1','2','3','4','5','6','7','8','9','0',
  ',','.','/',';',"'",'[',']','\\','`','-','='
}

bindKeys(hyperBindings, nil, function(mapping)
  hs.eventtap.keyStroke(hyperchord, mapping)
end)

local singleapps = {
  {'q', 'Quiver'},
}

bindKeys(singleapps, 1, function(mapping)
  t(launch, mapping[2])
end)

local kmtriggers = {
  {'7', '4C96F528-F08E-4F44-81CA-F516D1890581'}, -- resize window [1280x720]
  {'8', 'A49395EF-AAF6-4247-8F9F-6C84FDF1AB48'}, -- resize window [custom]
  {'i', 'B56AF462-18A9-4C02-9D0E-305D440975E5'}, -- capture image to clipboard
  {'p', '4BBD139F-461A-4084-91BE-30893485865E'}, -- paste screenshot
  {'u', '45ED37CD-5787-48C0-B38D-E001AE207B2F'}  -- uppercase text
}

bindKeys(kmtriggers, 1, function(mapping)
  t(jsx, mapping[2])
end)

-- Bind the hyper key

function pressedF18()
  hyper.triggered = false
  hyper:enter()
end

function releasedF18()
  hyper:exit()
  if not hyper.triggered then
    -- hs.eventtap.keyStroke({}, 'escape')
  end
end

f19 = hs.hotkey.bind({}, 'f18', pressedF18, releasedF18)

-- Bind submodes

hyper:bind({}, 'c', function() submode_c:enter() end)
hyper:bind({}, 'k', function() submode_k:enter() end)
hyper:bind({}, 't', function() submode_t:enter() end)
