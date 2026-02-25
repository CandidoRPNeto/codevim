local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")

local function get_current_branch()
  local handle = io.popen("git branch --show-current 2>/dev/null")
  if not handle then
    return nil
  end
  local branch = handle:read("*a"):match("^%s*(.-)%s*$")
  handle:close()
  return branch
end

local function get_all_branches()
  local handle = io.popen("git branch -a --format='%(refname:short)' 2>/dev/null")
  if not handle then
    return {}
  end

  local branches = {}
  local current = get_current_branch()
  for line in handle:lines() do
    local branch = line:match("^%s*(.-)%s*$")
    if branch and branch ~= "" and branch ~= current then
      table.insert(branches, branch)
    end
  end
  handle:close()
  return branches
end

local function get_diff_files(branch)
  local handle = io.popen("git diff --name-only " .. branch .. " 2>/dev/null")
  if not handle then
    return {}
  end

  local files = {}
  for line in handle:lines() do
    local filepath = line:match("^%s*(.-)%s*$")
    if filepath and filepath ~= "" then
      table.insert(files, filepath)
    end
  end
  handle:close()
  return files
end

local function compare_branches()
  local branches = get_all_branches()

  if #branches == 0 then
    vim.notify("Nenhuma outra branch encontrada", vim.log.levels.WARN)
    return
  end

  pickers.new({}, {
    prompt_title = "Selecione uma branch para comparar",
    finder = finders.new_table({
      results = branches,
    }),
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", function()
        local selection = action_state.get_selected_entry()
        if selection then
          actions.close(prompt_bufnr)
          local selected_branch = selection.value
          local diff_files = get_diff_files(selected_branch)

          if #diff_files == 0 then
            vim.notify("Nenhuma diferença encontrada com " .. selected_branch, vim.log.levels.INFO)
            return
          end

          pickers.new({}, {
            prompt_title = "Arquivos diferentes: " .. selected_branch,
            finder = finders.new_table({
              results = diff_files,
            }),
            sorter = sorters.get_generic_fuzzy_sorter(),
            attach_mappings = function(prompt_bufnr2, map2)
              map2("i", "<CR>", function()
                local file_selection = action_state.get_selected_entry()
                if file_selection then
                  actions.close(prompt_bufnr2)
                  local filepath = file_selection.value
                  vim.cmd("vertical diffsplit " .. vim.fn.fnameescape(filepath))
                end
              end)
              return true
            end,
          }):find()
        end
      end)
      return true
    end,
  }):find()
end

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
  compare = compare_branches,
}
