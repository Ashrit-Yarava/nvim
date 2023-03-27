-- Initialize Which key configuration
require("ash.config.whichkey")

-- Load MapX
require("mapx").setup({ global = true, whichkey = true })

require("ash.config")
require("ash.lazy")
require("ash.mappings")
