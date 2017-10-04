local kmtriggers = {}

for _, mapping in ipairs(kmtriggers) do
  submode_k:bind({}, mapping[1], function()
    jsx(mapping[2])
    submode_k:stop()
  end)
end
