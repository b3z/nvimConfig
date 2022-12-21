-- add vim user dictionary for ltex-ls
local path = vim.fn.stdpath 'config' .. '/spell/en.utf-8.add'
local words = {}

for word in io.open(path, 'r'):lines() do
  table.insert(words, word)
end

return {
  cmd = { "ltex-ls" },
  filetypes = { "markdown", "text", "tex" },
  flags = { debounce_text_changes = 300 },
  dictionary = {
    ['en-US'] = words,
    ['en-GB'] = words,
  },
}
