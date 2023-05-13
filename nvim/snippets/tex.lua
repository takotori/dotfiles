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
local file_pattern = "*.tex"
------------------------------------------------- boilerplate end
-- snippers go here:

local formSnippet = s(
	"form-",
	fmt(
  [[
\, \newline
\large \textcolor{{purple}}{{\( {1} \)}}\newline
\, \newline
\normalsize Legend: \newline
\begin{{itemize}}
\item {2}
\item {3}
\item {4} 
\item {5}
\end{{itemize}} 
    ]],
		{
			i(1, "formula"),
			i(2, "item 1"),
			i(3, "item 2"),
			i(4, "item 3"),
			i(5, "item 4"),
		}
	)
)
table.insert(snippets, formSnippet)

local listSnippet = s(
	"list-",
	fmt(
		[[ 
\begin{{itemize}}
\item \textcolor{{{1}}}{{{5}}}
\item \textcolor{{{2}}}{{{6}}}
\item \textcolor{{{3}}}{{{7}}}
\item \textcolor{{{4}}}{{{8}}}
\end{{itemize}} 
    ]],
		{
			i(1, "color"),
			rep(1),
			rep(1),
			rep(1),
			i(2, "item 1"),
			i(3, "item 2"),
			i(4, "item 3"),
			i(5, "item 4"),
		}
	)
)
table.insert(snippets, listSnippet)

local enumerateSnippet = s(
	"enum-",
	fmt(
		[[ 
\begin{{enumerate}}
\item \textcolor{{{1}}}{{{5}}}
\item \textcolor{{{2}}}{{{6}}}
\item \textcolor{{{3}}}{{{7}}}
\item \textcolor{{{4}}}{{{8}}}
\end{{enumerate}} 
    ]],
		{
			i(1, "color"),
			rep(1),
			rep(1),
			rep(1),
			i(2, "item 1"),
			i(3, "item 2"),
			i(4, "item 3"),
			i(5, "item 4"),
		}
	)
)
table.insert(snippets, enumerateSnippet)

local tableSnippet = s(
	"table-",
	fmt(
		[[ 
\begin{{table}}[ht!]
\section{{{}}}
\begin{{tabular}}{{|m{{0.2\linewidth}}|m{{0.755\linewidth}}|}}
\hline
{}
\hline
\end{{tabular}}
\end{{table}}
    ]],
		{
			i(1, "Section Name"),
			i(2, "data....."),
		}
	)
)
table.insert(snippets, tableSnippet)

local tabularSnippet = s(
	"tabular-",
	fmt(
		[[ 
\begin{{tabular}}{{|m{{0.2\linewidth}}|m{{0.755\linewidth}}|}}
\hline
{}
\hline
\end{{tabular}}
    ]],
		{
			i(1, "data....."),
		}
	)
)
table.insert(snippets, tabularSnippet)

local textcolorSnippet = s(
	"tx-",
	fmt(
		[[ 
\textcolor{{{1}}}{{{2}}}
    ]],
		{
			i(1, "color"),
			i(2, "text..."),
		}
	)
)
table.insert(snippets, textcolorSnippet)

local boldSnippet = s(
	"bold-",
	fmt(
		[[ 
\textbf{{{1}}}
    ]],
		{
			i(1, "text..."),
		}
	)
)
table.insert(snippets, boldSnippet)

local minipgSnippet = s(
	"mini-",
	fmt(
		[[
\minipg{{
{1}
}}{{
{2}
}}[{3}]
    ]],
		{
			i(1, "data..."),
			i(2, "data..."),
			i(3, "0.25,0.25"),
		}
	)
)
table.insert(snippets, minipgSnippet)

local graphicSnippet = s(
	"graph-",
	fmt(
		[[
\includegraphics[scale={1}]{{{2}}}
    ]],
		{
			i(1, "0.4"),
			i(2, "something.png"),
		}
	)
)
table.insert(snippets, graphicSnippet)

local lstSnippet = s(
	"code-",
	fmt(
		[[
\begin{{lstlisting}}
{}
\end{{lstlisting}}
    ]],
		{
			i(1, "data"),
		}
	)
)
table.insert(snippets, lstSnippet)

------------------------------------------------- snippets end
return snippets, autosnippets
