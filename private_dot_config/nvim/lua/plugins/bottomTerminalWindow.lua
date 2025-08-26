vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  bottom = {
    buffer = -1,
    window = -1,
  },
}

local function create_bottom_terminal(opts)
  opts = opts or {}

  local buffer = nil
  if vim.api.nvim_buf_is_valid(opts.buffer) then
    buffer = opts.buffer
  else
    buffer = vim.api.nvim_create_buf(false, true)
  end

  local window_config = {
    win = 0,
    split = "below",
    style = "minimal",
  }

  local window = vim.api.nvim_open_win(buffer, true, window_config)

  return { buffer = buffer, window = window }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.bottom.window) then
    state.bottom = create_bottom_terminal({ buffer = state.bottom.buffer })
    if vim.bo[state.bottom.buffer].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.bottom.window)
  end
end

vim.api.nvim_create_user_command("BottomTerminalWindow", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space>rr", toggle_terminal)
