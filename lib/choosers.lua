local chooser = hs.chooser.new(function(selection)
  print('chooser', selection)
end)

local choices = {
  {
    ["text"] = "Choice 1",
    ["subText"] = "This is the subtext of the first choice",
    ["uuid"] = "0001"
  },
  {
    ["text"] = "Choice 2",
    ["subText"] = "This is the subtext of the second choice",
    ["uuid"] = "0002"
  },
  {
    ["text"] = "Choice 3",
    ["subText"] = "This is the subtext of the third choice",
    ["uuid"] = "0003"
  },
}

chooser:choices(choices)
chooser:bgDark(false)

submode_c:bind({}, 'a', function()
  chooser:show()
  submode_c:exit()
end)
