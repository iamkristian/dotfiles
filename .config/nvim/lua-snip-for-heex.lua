+-- ls.setup({
+--   load_ft_func =
+--       -- Also load both lua and json when a markdown-file is opened,
+--       -- javascript for html.
+--       -- Other filetypes just load themselves.
+--       require("luasnip.extras.filetype_functions").extend_load_ft({
+--         markdown = {"lua", "json"},
+--         elixir = {"eelixir", "heex"},
+--         heex = {"elixir", "html"},
+--         html = {"javascript"}
+--       })
+--   }
+-- )