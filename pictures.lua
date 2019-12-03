local chonky_wheels =
{
  priority = "very-low",
  width = 115,
  height = 115,
  direction_count = 256,
  filenames =
  {
    "__base__/graphics/entity/diesel-locomotive/train-wheels-01.png",
    "__base__/graphics/entity/diesel-locomotive/train-wheels-02.png"
  },
  line_length = 8,
  lines_per_file = 16,
  scale = 1.5,
  shift = {0, -16/48},
  hr_version =
  {
    priority = "very-low",
    width = 229,
    height = 227,
    direction_count = 256,
    filenames =
    {
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-1.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-2.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-3.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-4.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-5.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-6.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-7.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = {0, -16/48},
    scale = 0.75
  }
}

return
{
  ["cargo-wagon"] =
  {
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          slice = 4,
          width = 444,
          height = 410,
          back_equals_front = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-1.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-2.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-3.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0, -1.1953125},
          hr_version =
          {
            priority = "very-low",
            slice = 4,
            width = 884,
            height = 814,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-1.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-2.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-3.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-4.png"
            },
            line_length = 4,
            lines_per_file = 8,
            shift = util.by_pixel(0, -37.875),
            scale = 0.5
          }
        },
        {
          flags = { "mask" },
          priority = "very-low",
          slice = 4,
          width = 392,
          height = 348,
          direction_count = 128,
          allow_low_quality_rotation = true,
          back_equals_front = true,
          apply_runtime_tint = true,
          shift = {0, -1.6875},
          filenames =
          {
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-mask-1.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-mask-2.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-mask-3.png"
          },
          line_length = 4,
          lines_per_file = 11,
          hr_version =
          {
            flags = { "mask" },
            priority = "very-low",
            slice = 4,
            width = 812,
            height = 742,
            direction_count = 128,
            allow_low_quality_rotation = true,
            back_equals_front = true,
            apply_runtime_tint = true,
            shift = util.by_pixel(-0.5, -45.375),
            filenames =
            {
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-mask-1.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-mask-2.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-mask-3.png"
            },
            line_length = 4,
            lines_per_file = 11,
            scale = 0.5
          }
        },
        {
          flags = { "shadow" },
          priority = "very-low",
          slice = 4,
          width = 492,
          height = 402,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-shadow-1.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-shadow-2.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-shadow-3.png",
            "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-shadow-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.8, -0.1171875},
          hr_version =
          {
            flags = { "shadow" },
            priority = "very-low",
            slice = 4,
            width = 980,
            height = 802,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-shadow-1.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-shadow-2.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-shadow-3.png",
              "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-shadow-4.png"
            },
            line_length = 4,
            lines_per_file = 8,
            shift = util.by_pixel(32, -3.375),
            scale = 0.5
          }
        }
      }
    },
    horizontal_doors = {
      layers =
      {
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-horizontal-end.png",
          line_length = 1,
          width = 440,
          height = 66,
          frame_count = 8,
          shift = {0, -1.3828125},
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-horizontal-end.png",
            line_length = 1,
            width = 876,
            height = 126,
            frame_count = 8,
            shift = util.by_pixel(0, -43.875),
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-horizontal-side.png",
          line_length = 1,
          width = 372,
          height = 76,
          frame_count = 8,
          shift = {0, -1.171875},
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-horizontal-side.png",
            line_length = 1,
            width = 736,
            height = 152,
            frame_count = 8,
            shift = util.by_pixel(0, -36.75),
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-horizontal-side-mask.png",
          width = 364,
          height = 70,
          line_length = 1,
          frame_count = 8,
          shift = {0, -1.2421875},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-horizontal-side-mask.png",
            width = 640,
            height = 138,
            line_length = 1,
            frame_count = 8,
            shift = util.by_pixel(0, -39.375),
            apply_runtime_tint = true,
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-horizontal-top.png",
          line_length = 1,
          width = 368,
          height = 56,
          frame_count = 8,
          shift = {0.015625, -1.6875},
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-horizontal-top.png",
            line_length = 1,
            width = 738,
            height = 108,
            frame_count = 8,
            shift = util.by_pixel(0.75, -53.25),
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-horizontal-top-mask.png",
          width = 370,
          height = 46,
          frame_count = 8,
          line_length = 1,
          shift = {0.015625, -1.75782},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-horizontal-top-mask.png",
            width = 738,
            height = 90,
            frame_count = 8,
            line_length = 1,
            shift = util.by_pixel(0.75, -56.625),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
      }
    },
    vertical_doors =
    {
      layers =
      {
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-vertical-end.png",
          line_length = 8,
          width = 60,
          height = 46,
          frame_count = 8,
          shift = util.by_pixel(0, 93.75),
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-vertical-end.png",
            line_length = 8,
            width = 116,
            height = 88,
            frame_count = 8,
            shift = util.by_pixel(0, 62.5),-- 361.5),
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-vertical-side.png",
          line_length = 8,
          width = 134,
          height = 338,
          frame_count = 8,
          shift = {0.015625, -1.523445},
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-vertical-side.png",
            line_length = 8,
            width = 254,
            height = 674,
            frame_count = 8,
            shift = util.by_pixel(0.25, -49.125),
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-vertical-side-mask.png",
          line_length = 8,
          width = 112,
          height = 326,
          frame_count = 8,
          shift = {0, -1.66407},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-vertical-side-mask.png",
            line_length = 8,
            width = 224,
            height = 652,
            frame_count = 8,
            shift = util.by_pixel(0, -53.25),
            apply_runtime_tint = true,
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-vertical-top.png",
          line_length = 8,
          width = 64,
          height = 336,
          frame_count = 8,
          shift = {0, -1.6875},
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-vertical-top.png",
            line_length = 8,
            width = 128,
            height = 674,
            frame_count = 8,
            shift = util.by_pixel(0, -53.625),
            scale = 0.5
          }
        },
        {
          filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/chonky-cargo-wagon-door-vertical-top-mask.png",
          line_length = 8,
          width = 64,
          height = 332,
          frame_count = 8,
          shift = {0, -1.734375},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__chonky-trains__/graphics/entity/chonky-cargo-wagon/hr-chonky-cargo-wagon-door-vertical-top-mask.png",
            line_length = 8,
            width = 128,
            height = 664,
            frame_count = 8,
            shift = util.by_pixel(0, -55.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
      }
    },
    wheels = chonky_wheels,
  },
  ["fluid-wagon"] =
  {
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          slice = 4,
          width = 208,
          height = 210,
          back_equals_front = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-1.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-2.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-3.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0 + 0.013, -2},
          scale = 2,
          hr_version =
          {
            priority = "very-low",
            slice = 4,
            width = 416,
            height = 419,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-1.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-2.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-3.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-4.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-5.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-6.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-7.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-8.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0 + 0.013, -2},
            scale = 1
          }
        },
        {
          flags = { "shadow" },
          priority = "very-low",
          slice = 4,
          width = 251,
          height = 188,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-1.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-2.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-3.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.875 + 0.013, 0.5},
          scale = 1.6,
          hr_version =
          {
            flags = { "shadow" },
            priority = "very-low",
            slice = 4,
            width = 501,
            height = 375,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-1.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-2.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-3.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-4.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-5.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-6.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-7.png"
            },
            line_length = 4,
            lines_per_file = 5,
            shift = {0.875 + 0.013, 0.5},
            scale = 0.8
          }
        }
      }
    },
    wheels = chonky_wheels,
  },
  ["locomotive"] =
  {
    pictures =
    {
      layers =
      {
        {
          slice = 4,
          priority = "very-low",
          width = 476,
          height = 460,
          direction_count = 256,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-01.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-02.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-03.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-04.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-05.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-06.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-07.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.75},
          hr_version =
          {
            priority = "very-low",
            slice = 4,
            width = 948,
            height = 916,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames =
            {
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-1.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-2.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-3.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-4.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-5.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-6.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-7.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-8.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-9.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-10.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-11.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-12.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-13.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-14.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-15.png",
              "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-16.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0.0, -0.75},
            scale = 0.5
            }
        },
        {
          priority = "very-low",
          flags = { "mask" },
          slice = 4,
          width = 472,
          height = 456,
          direction_count = 256,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-01.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-02.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-03.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-04.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-05.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-06.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-07.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-mask-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.75},
          apply_runtime_tint = true,
          hr_version =
            {
              priority = "very-low",
              flags = { "mask" },
              slice = 4,
              width = 944,
              height = 912,
              direction_count = 256,
              allow_low_quality_rotation = true,
              filenames =
              {
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-1.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-2.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-3.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-4.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-5.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-6.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-7.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-8.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-9.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-10.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-11.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-12.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-13.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-14.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-15.png",
                "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/hr-diesel-chonky-locomotive-mask-16.png"
              },
              line_length = 4,
              lines_per_file = 4,
              shift = {0.0, -0.75},
              apply_runtime_tint = true,
              scale = 0.5
            }
        },
        {
          priority = "very-low",
          slice = 4,
          flags = { "shadow" },
          width = 506,
          height = 424,
          direction_count = 256,
          draw_as_shadow = true,
          allow_low_quality_rotation = true,
          filenames =
          {
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-01.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-02.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-03.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-04.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-05.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-06.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-07.png",
            "__chonky-trains__/graphics/entity/diesel-chonky-locomotive/diesel-chonky-locomotive-shadow-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {1, 0.45}
        }
      }
    },
    wheels = chonky_wheels,
  }
}
