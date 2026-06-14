return {
  -- Smooth physics-based window movement behavior engine
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      easing = "quadratic", -- Clean acceleration curves
      duration_multiplier = 0.4, -- Speeds up the baseline scroll duration smoothly
    },
  },
}
