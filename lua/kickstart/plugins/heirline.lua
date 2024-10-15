return {
  'rebelot/heirline.nvim',
  -- You can optionally lazy-load heirline on UiEnter
  -- to make sure all required plugins and colorschemes are loaded before setup
  event = 'UiEnter',
  config = function()
    local utils = require 'heirline.utils'
    local conditions = require 'heirline.conditions'

    local colors = {
      bright_bg = utils.get_highlight('Folded').bg,
      bright_fg = utils.get_highlight('Folded').fg,
      red = utils.get_highlight('DiagnosticError').fg,
      dark_red = utils.get_highlight('DiffDelete').bg,
      green = utils.get_highlight('String').fg,
      blue = utils.get_highlight('Function').fg,
      gray = utils.get_highlight('NonText').fg,
      orange = utils.get_highlight('Constant').fg,
      purple = utils.get_highlight('Statement').fg,
      cyan = utils.get_highlight('Special').fg,
      diag_warn = utils.get_highlight('DiagnosticWarn').fg,
      diag_error = utils.get_highlight('DiagnosticError').fg,
      diag_hint = utils.get_highlight('DiagnosticHint').fg,
      diag_info = utils.get_highlight('DiagnosticInfo').fg,
      git_del = utils.get_highlight('diffDeleted').fg,
      git_add = utils.get_highlight('diffAdded').fg,
      git_change = utils.get_highlight('diffChanged').fg,
    }

    require('heirline').load_colors(colors)

    local FileType = {
      provider = function()
        return string.upper(vim.bo.filetype)
      end,
      hl = { fg = utils.get_highlight('Type').fg, bold = false },
    }

    local Space = {
      provider = ' | ',
      hl = { fg = 'blue', bold = true },
    }

    local WorkDir = {
      provider = function()
        local icon = (vim.fn.haslocaldir(0) == 1 and 'l' or 'g') .. ' ' .. ' '
        local cwd = vim.fn.getcwd(0)
        cwd = vim.fn.fnamemodify(cwd, ':~')
        if not conditions.width_percent_below(#cwd, 0.25) then
          cwd = vim.fn.pathshorten(cwd)
        end
        local trail = cwd:sub(-1) == '/' and '' or '/'
        return icon .. cwd .. trail
      end,
      hl = { fg = 'blue', bold = true },
    }

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { 'LspAttach', 'LspDetach' },

      -- You can keep it simple,
      -- provider = " [LSP]",

      -- Or complicate things a bit and get the servers names
      provider = function()
        local names = {}
        for i, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
          table.insert(names, server.name)
        end
        return ' [' .. table.concat(names, ' ') .. ']'
      end,
      hl = { fg = 'green', bold = true },
    }

    -- local StatusLine = { Ruler }
    local WinBar = { { Space }, { WorkDir }, { Space }, { LSPActive } }
    -- local TabLine = {}
    -- local StatusColumn = {}
    require('heirline').setup {
      -- statusline = StatusLine,
      winbar = WinBar,
      -- tabline = TabLine,
      -- statuscolumn = StatusColumn,
    }
  end,
}
