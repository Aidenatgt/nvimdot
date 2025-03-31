-- Function to get the visual selection
local function get_visual_selection()
  local csrow, cerow = 1, vim.api.nvim_buf_line_count(0)
  local mode = vim.fn.mode()

  -- Check if the current mode is visual
  if mode == "v" or mode == "V" or mode == "" then
    local cs = vim.fn.getpos(".")
    local ce = vim.fn.getpos("v")

    csrow = cs[2]
    cerow = ce[2]
  end

  -- Swap rows if necessary
  if cerow < csrow then
    csrow, cerow = cerow, csrow
  end

  local lines = vim.fn.getline(csrow, cerow)

  local n = #lines

  -- Return empty string if no lines are selected
  if n <= 0 then
    return ""
  end

  return { csrow, cerow, table.concat(lines, "\n") }
end


-- Function to edit the selection with GPT
local function edit_with_gpt()
  -- Helper function to write lines to the buffer
  local function write_lines(start, stop, content)
    print(start, stop)
    vim.api.nvim_buf_set_lines(0, start - 1, stop, false, vim.split(content, "\n"))
  end

  local selection = get_visual_selection()

  local csrow, cerow, content = selection[1], selection[2], selection[3]

  local prompt = vim.fn.input("Tell GPT how to edit the selection: ")

  -- Check if prompt is empty
  if prompt == "" then
    vim.notify("No prompt entered. Aborting.", vim.log.levels.WARN)
    return
  end

  py_str = string.format("python3 ~/.config/nvim/chatgpt_handler.py edit \"%s\" \"%s\"", prompt, content)

  local handle = io.popen(py_str)
  if handle == nil then
    vim.notify("Error: No response from the Python program.", vim.log.levels.ERROR)
    return
  end
  local result = handle:read("*a")
  handle:close()

  -- Check if result is empty
  if not result or result == "" then
    vim.notify("Error: No result from GPT.", vim.log.levels.ERROR)
    return
  end

  write_lines(csrow, cerow, result)
  vim.notify("Changes applied successfully!", vim.log.levels.INFO)
end

-- Function to review the selection with GPT
local function review_with_gpt()
  local selection = get_visual_selection()

  local content = selection[3]

  local prompt = vim.fn.input("Tell GPT what to review for: ")

  -- Check if prompt is empty
  if prompt == "" then
    vim.notify("No prompt entered. Aborting.", vim.log.levels.WARN)
    return
  end

  local handle = io.popen(string.format("python3 ~/.config/nvim/chatgpt_handler.py review \"%s\" \"%s\"", prompt, content))
  if handle == nil then
    vim.notify("Error: No response from the Python program.", vim.log.levels.ERROR)
    return
  end
  local result = handle:read("*a")
  handle:close()

  -- Check if result is empty
  if not result or result == "" then
    vim.notify("Error: No result from GPT.", vim.log.levels.ERROR)
    return
  end

  vim.notify(result, vim.log.levels.INFO, { timeout = 10000 })
end

-- Function to chat with GPT
local function chat_with_gpt()
  local prompt = vim.fn.input("Enter your prompt for ChatGPT: ")

  local handle = io.popen(string.format("python3 ~/.config/nvim/chatgpt_handler.py chat \"%s\" \"\"", prompt))
  if handle ~= nil then
    vim.notify("Python program failed to return a response.", vim.log.levels.INFO)
  else
    if handle == nil then
      vim.notify("Error: No response from the Python program.", vim.log.levels.ERROR)
      return
    end
    local result = handle:read("*a")
    handle:close()

    vim.notify(result, vim.log.levels.INFO, { timeout = 10000 })
  end
end

-- Key mappings for the functions
vim.keymap.set("n", "<leader>ge", edit_with_gpt, {})
vim.keymap.set("n", "<leader>gr", review_with_gpt, {})
vim.keymap.set("n", "<leader>gc", chat_with_gpt, {})
vim.keymap.set("v", "<leader>ge", edit_with_gpt, {})
vim.keymap.set("v", "<leader>gr", review_with_gpt, {})
vim.keymap.set("v", "<leader>gc", chat_with_gpt, {})
