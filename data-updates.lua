do return end

local util = require "util"

local SCALE_FACTOR_W = 1.5
local SCALE_FACTOR_H = 2
local WEIGHT_SCALE_FACTOR = 60

local sprite_mappings = {
  ["cargo-wagon"] = "jumbo-cargo-wagon",
  ["diesel-locomotive"] = "diesel-jumbo-locomotive",
  ["fluid-wagon"] = "jumbo-fluid-wagon",
  ["train-wheels"] = "jumbo-train-wheels",
}

for _, proto_type in pairs{"artillery-wagon", "cargo-wagon", "fluid-wagon", "locomotive"} do
  for _, proto in pairs(data.raw[proto_type]) do
    for from, to in pairs(sprite_mappings) do
      util.replace_sprites(proto, util.literal_pattern(from), to)
    end
    proto.vertical_selection_shift = proto.vertical_selection_shift * SCALE_FACTOR
    scale_bounding_box(proto.collision_box, SCALE_FACTOR)
    scale_bounding_box(proto.selection_box, SCALE_FACTOR)
    scale_bounding_box(proto.drawing_box, SCALE_FACTOR)
    proto.connection_distance = proto.connection_distance * SCALE_FACTOR
    proto.joint_distance = proto.joint_distance * SCALE_FACTOR
    proto.weight = proto.weight * WEIGHT_SCALE_FACTOR

    -- log(serpent.block(proto))

    proto.friction_force = 1e-9
    proto.air_resistance = 1e-9
  end
end

if data.raw.locomotive.locomotive then
  data.raw.locomotive.locomotive.max_speed =
    (120/60) * 1000 / 3600 -- 120 kph
  data.raw.locomotive.locomotive.max_power = "1200kW"
end
