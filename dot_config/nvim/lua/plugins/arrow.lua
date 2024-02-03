return {
  "otavioschwanck/arrow.nvim",
  opts ={
        show_icons = true,
        always_show_path = false,
        separate_by_branch = true,  -- bookmarks will be separated by git branch
        hide_handbook = false,      -- set to true to hide the shortcuts on menu.
        save_path = function()
            return vim.fn.stdpath("cache") .. "/arrow"
        end,
        mappings = {
            edit = "e",
            delete_mode = "d",
            clear_all_items = "C",
            toggle = "s",
            open_vertical = "v",
            open_horizontal = "-",
            quit = "q",
        },
        leader_key = ";",
        global_bookmarks = false, -- if true, arrow will save files globally (ignores separate_by_branch)
        index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
        full_path_list = { "update_stuff" } -- filenames on this list will ALWAYS show the file path too.
    } 
}
