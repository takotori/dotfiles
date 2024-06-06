local ls = require("luasnip")
-- some shorthands...
local s = ls.s
local i = ls.i
local t = ls.t
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}
local group = vim.api.nvim_create_augroup("Tex Snippets", { clear = true })
local file_pattern = "*.typst"
------------------------------------------------- boilerplate end
-- snippers go here:

local colorSnippet = s(
  "tx-",
  fmt([[ #text({1})[{2}] ]], {
    i(1, "color"),
    i(2, "text"),
  })
)
table.insert(snippets, colorSnippet)

local imageSnippet = s(
  "image-",
  fmt(
    [[
    #image("{1}", width: {2}%)
    ]],
    {
      i(1, "../../Screenshots/"),
      i(2, "100"),
    }
  )
)
table.insert(snippets, imageSnippet)

local figureSnippet = s(
  "figure-",
  fmt(
    [[
     #align(
       center, [#figure(
           img("{1}", width: {2}%, extension: "{3}"), caption: [{4}],
         )<{5}>],
     )
    ]],
    {
      i(1, ""),
      i(2, "100"),
      i(3, "figures"),
      i(4, ""),
      i(5, ""),
    }
  )
)
table.insert(snippets, figureSnippet)

local centerImageSnippet = s(
  "cimage-",
  fmt(
    [[
    #align(center, [#image("{1}", width: {2}%)])
    ]],
    {
      i(1, "../../Screenshots"),
      i(2, "100"),
    }
  )
)
table.insert(snippets, centerImageSnippet)

local colSnippet = s(
  "col-",
  fmt(
    [[
    #columns({1}, [{2}])
    ]],
    {
      i(1, "col-amount"),
      i(2, "content"),
    }
  )
)
table.insert(snippets, colSnippet)

local codeSnippet = s(
  "code-",
  fmt(
    [[
    ```{1}
    {2}
    ```
    ]],
    {
      i(1, ""),
      i(2, ""),
    }
  )
)
table.insert(snippets, codeSnippet)

local patternSnippet = s(
  "pattern-",
  fmt(
    [[
    #subsection([{1}])
    #set text(size: 14pt)
    
    *Problem* | {2}\
    *Solution* | {3}\
    #set text(size: 11pt)
    {4}
    
    #columns(2, [
      #text(green)[Benefits]
      - {5}
      #colbreak()
      #text(red)[Liabilities]
      - {6}
    ])
    ]],
    {
      i(1, ""),
      i(2, ""),
      i(3, ""),
      i(4, ""),
      i(5, ""),
      i(6, ""),
    }
  )
)
table.insert(snippets, patternSnippet)
------------------------------------------------- snippets end
return snippets, autosnippets
