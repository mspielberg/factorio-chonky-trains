local data = { raw = require "data-raw" }
local scale_sprite = require "scale-sprite"

-- literal_pattern returns a pattern string that matches literal,
-- by escaping any metacharacters present.
local function literal_pattern(literal)
  return literal:gsub("[%^%(%)%%%.%[%]%*%+%-%?]", "%%%1")
end

local rolling_stock_types = {
  "cargo-wagon",
  "fluid-wagon",
--  "artillery-wagon",
  "locomotive",
}

local sprite_fields = {
  "horizontal_doors",
  "vertical_doors",
  "pictures",
  "wheels",
}

local function filename_transformer(name, new_name)
  return function(filename)
    filename = filename:gsub("__base__", "output")
    return filename:gsub(literal_pattern(name), new_name)
  end
end

local proto_name = arg[1]
for _, proto_type in pairs(rolling_stock_types) do
  local proto = data.raw[proto_type][proto_name]
  if proto then
    for _, field_name in pairs(sprite_fields) do
      if proto[field_name] then
        if field_name == "horizontal_doors" then
          scale_sprite.scale_sprite(
            proto[field_name],
            2,
            1.5,
            filename_transformer(proto_name, "chonky-"..proto_name))
        else
          scale_sprite.scale_sprite(
            proto[field_name],
            1.5,
            2,
            filename_transformer(proto_name, "chonky-"..proto_name))
        end
      end
    end
    if proto.corpse then
      scale_sprite.scale_sprite(
        data.raw.corpse[proto.corpse].animation,
          1.5,
          2,
          filename_transformer(proto_name, "chonky-"..proto_name))
    end
  end
end