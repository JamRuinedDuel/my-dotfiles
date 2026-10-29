_G.Keymaps = {}
_G.Utils = {}

require("JamRuinedDuel.types")
require("JamRuinedDuel.core.options")
require("JamRuinedDuel.utils")
require("JamRuinedDuel.plugins")

-- NOTE Keep this at the bottom so keymaps will be loaded last.
require("JamRuinedDuel.core.keymaps")
