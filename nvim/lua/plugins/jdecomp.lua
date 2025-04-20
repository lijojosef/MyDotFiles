return {
  "alienman5k/jdecomp.nvim",
  opts = {
    decompiler = "fernflower", -- cfr, procyon, fernflower
    provider = {
      cfr = {
        -- bin = 'cfr'
        jar = os.getenv("HOME") .. "/Software/cfr-0.152.jar",
      },
      procyon = {
        jar = os.getenv("HOME") .. "/Software/procyon-decompiler-0.6.0.jar",
      },
      fernflower = {
        jar = os.getenv("HOME") .. "/Software/fernflower.jar",
      },
    },
  },
}
