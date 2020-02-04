local pictures = require "pictures"

local rolling_stock_types = {
  "cargo-wagon",
  "fluid-wagon",
  "locomotive",
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

local function item_with_place_result(name)
  for _, protos in pairs(data.raw) do
    for _, proto in pairs(protos) do
      if proto.place_result == name then
        return proto
      end
    end
  end
end

local function recipe_has_place_result_with_any_type(recipe, entity_types)
  for _, recipe_data in pairs{recipe.normal, recipe.expensive, recipe} do
    for _, result in pairs(recipe_data.results or {{recipe_data.result}}) do
      local result_name = result.name or result[1]
      local result = result_name and item_with_place_result(result_name)
      if result and result.place_result then
        local place_result = result.place_result
        for _, proto_type in pairs(entity_types) do
          if data.raw[proto_type][place_result] then
            return result_name
          end
        end
      end
    end
  end
  return nil
end

local function edit_recipe(recipe, f)
  for _, recipe_data in pairs{recipe.normal, recipe.expensive, recipe} do
    f(recipe_data)
  end
end

local function replace_recipe_result(recipe, from, to)
  edit_recipe(recipe, function(recipe_data)
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
  end)
end

local function scale_recipe_ingredients(recipe, factor)
  for _, recipe_data in pairs{recipe.normal, recipe.expensive, recipe} do
    for _, ingredient in pairs(recipe_data.ingredients) do
      local name = ingredient.name or ingredient[1]
      local new_name = "chonky-"..name
      if data.raw["item-with-entity-data"][new_name] then
        ingredient.name = ingredient.name and new_name
        ingredient[1] = ingredient[1] and new_name
      else
        ingredient.amount = ingredient.amount and ingredient.amount * factor
        ingredient[2] = ingredient[2] and ingredient[2] * factor
      end
    end
  end
end

local function create_rolling_stock(proto)
  local chonky = table.deepcopy(proto)
  for k,v in pairs(pictures[chonky.type]) do
    chonky[k] = table.deepcopy(v)
  end
  chonky.name = "chonky-"..chonky.name
  chonky.localised_name = {"chonky-trains.chonky",
    chonky.localised_name or {"entity-name."..proto.name}}
  chonky.collision_box = {{-1, -5.6}, {1, 5.6}}
  chonky.selection_box = {{-1.5, -6.5}, {1.5, 6.5}}
  chonky.drawing_box = {{-1.5, -8}, {1.5, 7}}
  chonky.connection_distance = 6
  chonky.joint_distance = 8
  chonky.vertical_selection_shift = -1

  if chonky.burner then
    chonky.burner.fuel_inventory_size = chonky.burner.fuel_inventory_size * 3
  end
  chonky.inventory_size = (chonky.inventory_size or 0) * 4
  chonky.capacity = (chonky.capacity or 0) * 4
  chonky.max_power = ((chonky.max_power or "0kW"):match("^[0-9]*") * 4).."kW"
  chonky.max_speed = chonky.max_speed * 0.45
  chonky.weight = 10000
  data:extend{chonky}

  local item = find_item_for_entity(proto.name)
  if item then
    local old_name = item.name
    item = table.deepcopy(item)
    item.name = "chonky-"..item.name
    item.localised_name = {"chonky-trains.chonky",
      item.localised_name or {"entity-name."..item.place_result}}
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
  end

  if proto.corpse then
    local corpse = table.deepcopy(data.raw.corpse[proto.corpse])
    log(serpent.block(corpse))
    corpse.name = "chonky-"..corpse.name
    local animations = (corpse.animation.frame_count or corpse.animation.layers)
      and {corpse.animation} or corpse.animation
    for _, animation in pairs(animations) do
      local layers = animation.layers or {animation}
      for _, layer in pairs(layers) do
        layer.scale = 1.5
        if layer.hr_version then
          layer.hr_version.scale = 0.75
        end
      end
    end
    chonky.corpse = corpse.name
    log(serpent.block(corpse))
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

for _, recipe in pairs(data.raw.recipe) do
  local item_name = recipe_has_place_result_with_any_type(recipe, rolling_stock_types)
  local item = data.raw["item-with-entity-data"][item_name]
  local new_item_name = item_name and "chonky-"..item_name
  local new_item = data.raw["item-with-entity-data"][new_item_name]
  if item_name and new_item then
    local new_recipe = table.deepcopy(recipe)
    new_recipe.name = "chonky-"..recipe.name
    new_recipe.localised_name = {"chonky-trains.chonky",
      recipe.localised_name or {"entity-name."..item.place_result}}
    replace_recipe_result(new_recipe, item_name, new_item_name)
    scale_recipe_ingredients(new_recipe, 2)
    data:extend{new_recipe}
  end
end

for _, tech in pairs(data.raw.technology) do
  for _, effect in pairs(tech.effects or {}) do
    if effect.type == "unlock-recipe" then
      local chonky_recipe_name = "chonky-"..effect.recipe
      if data.raw.recipe[chonky_recipe_name] then
        table.insert(tech.effects, {
          type = "unlock-recipe",
          recipe = chonky_recipe_name,
        })
      end
    end
  end
end
