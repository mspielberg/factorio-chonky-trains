local configchange = require "configchange"

local function on_configuration_changed(data)
  configchange.fix_recipe_state()
end

script.on_configuration_changed(on_configuration_changed)
