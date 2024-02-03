vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.numberwidth = 2

function _jt_log(msg)
    print(msg)
end

-- finds component root relating to current path
function _jt_component_root()
    local app_dir = vim.fn.fnamemodify(vim.fn.finddir('app', '.;'), ':p')
    return vim.fn.fnamemodify(app_dir, ':h:h')
end

function _jt_file()
    -- get the name of the file in current buffer
    -- local filename = vim.api.nvim_buf_get_name(0)

    destination = _jt_destination_candidate()
    if destination then
        vim.cmd.edit(destination)
    end
end

-- finds possible destination candidates based on the name of the file
function _jt_destination_candidate()
    local filename = vim.api.nvim_buf_get_name(0)
    local component_root_path = _jt_component_root()

    local component_root_path_pattern = component_root_path:gsub("[%(%)%.%%%+%-%*%?%[%^%$%]]", "%%%1")
    local rel_path = filename:gsub(component_root_path_pattern, '')

    -- resolve candidate
    local candidate = nil
    local source_type = _jt_source_type(rel_path)
    if source_type == "source" then
        candidate = rel_path:gsub('.rb$', '_spec.rb'):gsub("^/app/", "/spec/")
    else
        candidate = rel_path:gsub('_spec.rb$', '.rb'):gsub("^/spec/", "/app/")
    end
    candidate = component_root_path .. candidate
    
    -- check if we have the candidate
    if vim.fn.findfile(candidate) ~= '' then
        return candidate
    else
        return nil
    end
end

function _jt_source_type(rel_path)
    if rel_path:match('_spec.rb$') then
        return 'spec'
    else
        return 'source'
    end
end

local opts = { noremap = true, silent = true }
vim.api.nvim_buf_set_keymap(0, "n", "gt", "<cmd>lua _jt_file()<CR>", opts)
