return {
  'AlphaTechnolog/pywal.nvim',
  priority = 1000,
  config = function()
    local pywal = require("pywal")
    pywal.setup()
  end
}
