local _already_scaled = {}

-- literal_pattern returns a pattern string that matches literal,
-- by escaping any metacharacters present.
local function literal_pattern(literal)
  return literal:gsub("[%^%(%)%%%.%[%]%*%+%-%?]", "%%%1")
end

local function replace_sprites(t, from, to)
  for k,v in pairs(t) do
    if type(v) == "string" and v:find(v..".*%.png$") then
      t[k] = v:gsub(from, to)
    elseif type(v) == "table" then
      replace_sprites(t, from, to)
    end
  end
end

local function scale_animation(animation, scale_factor)
  if not animation then return end
  if _already_scaled[animation] then return end
  _already_scaled[animation] = true

  if animation.layers then
    for _, layer in pairs(animation.layers) do
      scale_animation(layer, scale_factor)
    end
    return
  end

  if animation.hr_version then
    scale_animation(animation.hr_version, scale_factor)
  end

  animation.scale = (animation.scale or 1) * scale_factor
  animation.shift = util.mul_shift(animation.shift, scale_factor)
end

local function scale_bounding_box(box, scale_factor_x, scale_factor_y)
  if not box then return end
  if _already_scaled[box] then return end
  _already_scaled[box] = true
  if not scale_factor_y then scale_factor_y = scale_factor_x end

  local lu = box.left_upper or box[1]
  local rb = box.right_bottom or box[2]
  for _, p in pairs{lu, rb} do
    if p.x then p.x = p.x * scale_factor_x else p[1] = p[1] * scale_factor_x end
    if p.y then p.y = p.y * scale_factor_y else p[2] = p[2] * scale_factor_y end
  end
end

local function scale_rotated_sprite(pictures, scale_factor)
  if not pictures then return end
  if _already_scaled[pictures] then return end
  _already_scaled[pictures] = true

  if pictures.layers then
    for _, layer in pairs(pictures.layers) do
      scale_rotated_sprite(layer, scale_factor)
    end
    return
  end

  if pictures.hr_version then
    scale_rotated_sprite(pictures.hr_version, scale_factor)
  end

  pictures.scale = (pictures.scale or 1) * scale_factor
  pictures.shift = util.mul_shift(pictures.shift, scale_factor)
end

return {
  literal_pattern = literal_pattern,
  replace_sprites = replace_sprites,
  scale_animation = scale_animation,
  scale_bounding_box = scale_bounding_box,
  scale_rotated_sprite = scale_rotated_sprite,
}
