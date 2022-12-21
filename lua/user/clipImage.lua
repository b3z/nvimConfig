require("clipboard-image").setup {
  -- Default configuration for all filetype
  default = {
    img_dir = "img",
    img_name = function() return os.date "%Y-%m-%d-%H-%M-%S" end, -- Example result: "2021-04-13-10-04-18"
    affix = "![](%s)", -- Multi lines affix
  },
}
