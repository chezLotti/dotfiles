vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  floating = {
    buffer = -1,
    window = -1,
  },
}

local function create_floating_terminal(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buffer = nil
  if vim.api.nvim_buf_is_valid(opts.buffer) then
    buffer = opts.buffer
  else
    buffer = vim.api.nvim_create_buf(false, true)
  end

  local window_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local window = vim.api.nvim_open_win(buffer, true, window_config)

  return { buffer = buffer, window = window }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.window) then
    state.floating = create_floating_terminal({ buffer = state.floating.buffer })
    if vim.bo[state.floating.buffer].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.window)
  end
end

vim.api.nvim_create_user_command("FloatingTerminalWindow", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal)
