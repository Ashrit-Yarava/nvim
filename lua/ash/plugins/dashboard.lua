return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = require("ash.config.dashboard").opts,
    config = require("ash.config.dashboard").config
}
