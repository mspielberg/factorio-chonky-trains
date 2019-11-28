local pictures = require "pictures"
local du = require "util"

local connection_distances = {
  ["cargo-wagon"] = 4,
  ["fluid-wagon"] = 4,
  ["locomotive"] = 4,
}

local joint_distances = {
  ["cargo-wagon"] = 10,
  ["fluid-wagon"] = 10,
  ["locomotive"] = 9,
}

local weights = {
  ["cargo-wagon"] = 10000,
  ["fluid-wagon"] = 10000,
  ["locomotive"] = 11000,
}

local function find_item_for_entity(entity_name)
  for _, protos in pairs(data.raw) do
    for _, proto in pairs(protos) do
      if proto.place_result == entity_name then
        return proto
      end
    end
  end
end

local function find_recipes_for_item(item_name)
  local out = {}
  for name, recipe in pairs(data.raw.recipe) do
    for _, recipe_data in pairs{recipe.normal, recipe.expensive, recipe} do
      if recipe_data.result == item_name then
        out[#out+1] = recipe
      elseif recipe_data.results then
        for _, result in pairs(recipe_data.results) do
          if result.name == item_name or result[1] == item_name then
            out[#out+1] = recipe
          end
        end
      end
    end
  end
  return out
end

local function replace_recipe_result(recipe, from, to)
  for _, recipe_data in pairs{recipe.normal, recipe.expensive, recipe} do
    if recipe_data.result == from then
      recipe_data.result = to
    elseif recipe_data.results then
      for _, result in pairs(recipe_data.results) do
        if result.name == from then
          result.name = to
        elseif result[1] == from then
          result.name = to
        end
      end
    end
  end
end

local function scale_recipe_ingredients(recipe, factor)
  for _, recipe_data in pairs{recipe.normal, recipe.expensive, recipe} do
    for _, ingredient in pairs(recipe_data.ingredients) do
      if ingredient.amount then ingredient.amount = ingredient.amount * factor end
      if ingredient[2] then ingredient[2] = ingredient[2] * factor end
    end
  end
end

local function create_rolling_stock(proto)
  local chonky = table.deepcopy(proto)
  for k,v in pairs(pictures[chonky.type]) do
    chonky[k] = table.deepcopy(v)
  end
  chonky.name = "chonky-"..chonky.name
  du.scale_bounding_box(chonky.collision_box, 1.5, 2.3)
  chonky.selection_box = {{-1.5, -6}, {1.5, 6}}
  --du.scale_bounding_box(chonky.selection_box, 1.5, 2.3)
  chonky.connection_distance = connection_distances[proto.type]
  chonky.joint_distance = joint_distances[proto.type]
  chonky.vertical_selection_shift = -1

  if chonky.burner then
    chonky.burner.fuel_inventory_size = 10
  end
  chonky.inventory_size = (chonky.inventory_size or 0) * 4
  chonky.capacity = (chonky.capacity or 0) * 4
  chonky.max_power = ((chonky.max_power or "0kW"):match("^[0-9]*") * 4).."kW"
  chonky.max_speed = (120/60) * 1000 / 3600 -- 120 kph
  chonky.weight = weights[chonky.type]
  data:extend{chonky}

  local item = find_item_for_entity(proto.name)
  if item then
    local old_name = item.name
    item = table.deepcopy(item)
    item.name = "chonky-"..item.name
    item.place_result = "chonky-"..item.place_result
    data:extend{item}

    if chonky.minable and chonky.minable.results then
      for _, result in pairs(chonky.minable.results) do
        if result.name == old_name then
          result.name = item.name
        end
      end
    elseif chonky.minable and chonky.minable.result then
      chonky.minable.result = item.name
    end

    for _, recipe in pairs(find_recipes_for_item(old_name)) do
      log(serpent.block(recipe))
      recipe = table.deepcopy(recipe)
      recipe.name = "chonky-"..recipe.name
      replace_recipe_result(recipe, old_name, item.name)
      scale_recipe_ingredients(recipe, 4)
      data:extend{recipe}
    end   
  end

  if proto.corpse then
    local corpse = table.deepcopy(data.raw.corpse[proto.corpse])
    corpse.name = "chonky-"..corpse.name
    local layers = corpse.animation.layers or {corpse.animation}
    for _, layer in pairs(layers) do
      layer.scale = 1.5
      if layer.hr_version then
        layer.hr_version.scale = 0.75
      end
    end
    chonky.corpse = corpse.name
    data:extend{corpse}
  end
end

for _, proto_type in pairs{"cargo-wagon", "fluid-wagon", "locomotive"} do
  for name, proto in pairs(data.raw[proto_type]) do
    if not name:find("^chonky%-") then
      create_rolling_stock(proto)
    end
  end
end

local tech = {
  name = "chonky-trains",
  type = "technology",
  icon = "__base__/graphics/technology/railway.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "chonky-cargo-wagon",
    },
    {
      type = "unlock-recipe",
      recipe = "chonky-fluid-wagon",
    },
    {
      type = "unlock-recipe",
      recipe = "chonky-locomotive",
    },
  },
  prerequisites = {"fluid-wagon"},
  unit = {
    count = 500,
    ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}},
    time = 30,
  },
}
data:extend{tech}
