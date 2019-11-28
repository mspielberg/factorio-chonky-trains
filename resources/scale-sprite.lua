local serpent = require "serpent"

-- affine_calc returns the matrix to rotate an image by angle radians CCW,
-- scale it, and rotate it back.
local function affine_calc(angle, scale_x, scale_y)
  local s = math.sin(angle)
  local s2 = s*s
  local c = math.cos(angle)
  local c2 = c*c
  local sc = s*c

  return {
    sx = scale_x * c2 + scale_y * s2,
    sy = scale_y * c2 + scale_x * s2,
    rx = scale_x * sc - scale_y * sc,
    ry = scale_x * sc - scale_y * sc,
  }
end

-- @return function that returns filename, x, y, angle
local function frame_iter(sprite)
  local filenames = sprite.filenames or { sprite.filename }
  local filename_index = 1
  local x = 0
  local y = 0
  local direction_index = 0
  local max_direction_index = (sprite.direction_count or 1) - 1
  local frame = 0
  local max_frame = sprite.frame_count or 1
  local mx = sprite.line_length - 1
  local my = sprite.lines_per_file or math.huge
  return function()
    frame = frame + 1
    if frame > max_frame then
      -- go to next rotation
      frame = 1
      direction_index = direction_index + 1
      if direction_index > sprite.direction_count then return end
    end
    if x > mx then
      x = 0
      y = y + 1
    end
    if y > my then
      -- next file
      x = 0
      y = 0
      filename_index = filename_index + 1
      if filename_index > #filenames then return end
    end

    local angle = 2 * math.pi * (direction_index / (sprite.direction_count or 1))
    return filenames[filename_index], x, y, angle
  end
end

local function compute_gm_script(args)
  print(serpent.block(args))
  local infile = args.filename
  local outfile = args.output_filename
  local orig_tile_w = args.width
  local orig_tile_h = args.height
  local direction_count = args.direction_count or 1
  local frame_count = args.frame_count or 1
  local line_length = args.line_length or 1
  local lines = args.lines_per_file or (frame_count / line_length)
  local scale_factor_w = args.scale_w
  local scale_factor_h = args.scale_h

  local max_scale_factor = scale_factor_w
  if scale_factor_h > scale_factor_w then
    max_scale_factor = scale_factor_h
  end
  local new_tile_w = orig_tile_w * max_scale_factor
  local new_tile_h = orig_tile_h * max_scale_factor
  local initial_tile_num = (args.file_num - 1) * line_length * lines

  local out={}
  out[#out+1] = ("convert '%s' -crop %dx%d +adjoin %s\n"):format(infile, orig_tile_w, orig_tile_h, "t%02d.png")
  for i=0,(line_length*lines)-1 do
    angle = (2 * math.pi / direction_count) * math.floor((i + initial_tile_num) / frame_count)
    local affine_clause = ""
    local af = affine_calc(angle, scale_factor_w, scale_factor_h)
    affine_clause = ("-affine %f,%f,%f,%f,0,0 "):format(af.sx, af.rx, af.ry, af.sy)
    out[#out+1] =
      ("convert t%02d.png %s -transform t%02da.png\n"):
        format(i, affine_clause, i)
  end
  --[[
  local iter = frame_iter(sprite)
  for filename, x, y, angle in iter do
    local affine_clause = ""
    if angle > 0 then
      local af = affine_calc(angle, scale_factor_w, scale_factor_h)
      affine_clause = ("-affine %f,%f,%f,%f,0,0 "):format(af.sx, af.rx, af.ry, af.sy)
    end
    out[#out+1] =
      ("convert t%02d.png %s -transform t%02da.png\n"):
        format(i, affine_clause, i)
  end
  ]]
  out[#out+1] =
    ("montage -background transparent +frame +shadow +label -tile %dx%d -geometry %dx%d+0+0 t*a.png '%s'\n"):
      format(line_length, lines, new_tile_w, new_tile_h, outfile)

  return table.concat(out, " ")
end

local function basename(filename)
  return filename:match("([^/]+)$")
end

local function scale_spritesheet(args)
  local script = compute_gm_script(args)
  local fh = io.open(basename(args.output_filename)..".gmbatch", "w")
  fh:write(script)
  fh:close()
end

local function scale_spritesheets(sprite, scale_w, scale_h, filename_transform)
  if sprite.layers then
    for _, layer in pairs(sprite.layers) do
      scale_spritesheets(layer, scale_w, scale_h, filename_transform)
    end
  end

  if sprite.hr_version then
    scale_spritesheets(sprite.hr_version, scale_w, scale_h, filename_transform)
  end

  local fields = {"width", "height", "direction_count", "frame_count", "line_length", "lines_per_file"}
  local args = { scale_w = scale_w, scale_h = scale_h }
  for _, field in pairs(fields) do
    args[field] = sprite[field]
  end
  if sprite.back_equals_front then
    args.direction_count = args.direction_count * 2
  end

  local filenames = sprite.filenames or { sprite.filename }
  for i, filename in pairs(filenames) do
    args.filename = filename
    args.output_filename = filename_transform(filename)
    args.file_num = i
    scale_spritesheet(args)
  end
end

return {
  scale_sprite = scale_spritesheets,
}
