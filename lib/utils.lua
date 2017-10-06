function bindKeys(mappings, keyIndex, fn)
  for _, mapping in ipairs(mappings) do
    local key = mapping
    if keyIndex ~= nil then
      key = mapping[keyIndex]
    end
    hyper:bind({}, key, function()
      fn(mapping)
    end)
  end
end

function jsx(id)
  local js = [[
    var app = Application('Keyboard Maestro Engine');
    app.doScript(']] .. id .. [[');
  ]]
  local status, object, descriptor = hs.osascript.javascript(js)
end

function launch(appname)
  hs.application.launchOrFocus(appname)
end

function t(fn, ...)
  hyper.triggered = true
  fn(...)
end
