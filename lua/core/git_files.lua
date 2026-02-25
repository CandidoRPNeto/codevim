local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function get_git_status_files()
  local handle = io.popen("git status --porcelain 2>/dev/null")
  if not handle then
    return {}
  end

  local files = {}
  for line in handle:lines() do
    local filepath = line:sub(4):match("^%s*(.-)%s*$")
    if filepath ~= "" and filepath ~= nil then
      local is_directory = vim.fn.isdirectory(filepath) == 1
      if not is_directory then
        table.insert(files, filepath)
      end
    end
  end
  handle:close()
  return files
end

local function open_all_git_files()
  local files = get_git_status_files()

  if #files == 0 then
    vim.notify("Nenhum arquivo modificado encontrado", vim.log.levels.INFO)
    return
  end

  for _, filepath in ipairs(files) do
    vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  end

  vim.notify("Abrindo " .. #files .. " arquivo(s) do git status", vim.log.levels.INFO)
end

local function pick_git_files()
  local files = get_git_status_files()

  if #files == 0 then
    vim.notify("Nenhum arquivo modificado encontrado", vim.log.levels.INFO)
    return
  end

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local sorters = require("telescope.sorters")

  pickers.new({}, {
    prompt_title = "Arquivos Git Status",
    finder = finders.new_table({
      results = files,
    }),
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<space>", actions.toggle_selection)
      map("i", "<CR>", function()
        local selection = action_state.get_selected_entry()
        if selection then
          actions.close(prompt_bufnr)
          vim.cmd("edit " .. vim.fn.fnameescape(selection.value))
        end
      end)
      return true
    end,
  }):find()
end

return {
  open_all = open_all_git_files,
  pick = pick_git_files,
}
