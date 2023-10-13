local cmd = vim.cmd
local fn = vim.fn

local defaults = {
	comment_italics = true,
	background_set = false,
	background_color = require("colorbuddy.init").Color.none,
}

local M = {
	Color = require("colorbuddy.init").Color,
	colors = require("colorbuddy.init").colors,
	Group = require("colorbuddy.init").Group,
	groups = require("colorbuddy.init").groups,
	styles = require("colorbuddy.init").styles,
}

function M.setup(opts)
	if not opts then
		opts = {}
	end

	for k, v in pairs(defaults) do
		if opts[k] == nil then
			opts[k] = v
		end
	end

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if fn.exists("syntax_on") then
		cmd("syntax reset")
	end

	vim.g.colors_name = "yiyi"

	local Color = M.Color
	local colors = M.colors
	local Group = M.Group
	local groups = M.groups
	local styles = M.styles

	Color.new("base03", "#002b36")
	Color.new("base04", "#155869")
	Color.new("base02", "#54005c")
	Color.new("base01", "#586e75")
	Color.new("base00", "#657b83")
	Color.new("base0", "#fff0ff")
	Color.new("base1", "#93a1a1")
	Color.new("base2", "#eee8d5")
	Color.new("base3", "#fdf6e3")
	Color.new("yellow", "#f5f12c")
	Color.new("orange", "#ff6e19")
	Color.new("red", "#FF007E")
	Color.new("magenta", "#FF0000")
	Color.new("violet", "#6c71c4")
	-- Color.new('blue', '#0091FF')
	Color.new("blue", "#00a2ff")
	-- Color.new('blue', '#03fbff')
	Color.new("cyan", "#01fdfd")
	-- Color.new('green', '#00FF00')
	Color.new("green", "#00FF77")
	Color.new("purple", "#FF44FF")
	Color.new("menu", "#21222C")
	Color.new("selection", "#44475A")
	Color.new("white2", "#ABB2BF")
	Color.new("bg2", "#282A36")

	Color.new("bg", colors.base03)
	Group.new("Error", colors.red)
	Group.new("Warning", colors.yellow)
	Group.new("Information", colors.blue)
	Group.new("Hint", colors.cyan)

	-- normal non-current text
	Group.new("Normal", colors.base0, colors.NONE, styles.NONE)
	Group.new("NormalNC", colors.base0:dark(), colors.NONE, styles.NONE)

	Group.new("Comment", colors.base01, colors.none, opts.comment_italics and styles.italic or styles.NONE)
	-- Any variable name, function or class name

	-- any statement, conditional, repeat (for, do while), label, operator
	Group.new("Type", colors.blue, colors.none, styles.NONE)
	Group.new("Structure", colors.blue, colors.none, styles.NONE)
	Group.new("StorageClass", colors.blue, colors.none, styles.NONE)
	Group.new("Identifier", colors.blue, colors.none, styles.NONE)
	Group.new("Constant", colors.orange, colors.none, styles.NONE)

	Group.new("PreProc", colors.red, colors.none, styles.NONE)
	Group.new("PreCondit", colors.red, colors.none, styles.NONE)
	Group.new("Include", colors.red, colors.none, styles.NONE)
	Group.new("Keyword", colors.red, colors.none, styles.NONE)
	Group.new("Define", colors.red, colors.none, styles.NONE)
	Group.new("Typedef", colors.red, colors.none, styles.NONE)
	Group.new("Exception", colors.red, colors.none, styles.NONE)
	Group.new("Conditional", colors.red, colors.none, styles.NONE)

	Group.new("Repeat", colors.red, colors.none, styles.NONE)
	Group.new("Statement", colors.red, colors.none, styles.NONE)
	Group.new("Macro", colors.purple, colors.none, styles.NONE)
	Group.new("Error", colors.red, colors.none, styles.NONE)
	Group.new("Label", colors.purple, colors.none, styles.NONE)
	Group.new("Special", colors.cyan, colors.none, styles.NONE)
	Group.new("SpecialChar", colors.purple, colors.none, styles.NONE)
	Group.new("Boolean", colors.purple, colors.none, styles.NONE)
	Group.new("String", colors.purple, colors.none, styles.NONE)
	Group.new("Character", colors.yellow, colors.none, styles.NONE)

	Group.new("Number", colors.purple, colors.none, styles.NONE)
	Group.new("Float", colors.purple, colors.none, styles.NONE)
	Group.new("Function", colors.green, colors.none, styles.italic)
	Group.new("FunctionBuiltin", colors.green, colors.none, styles.italic)
	Group.new("Operator", colors.red, colors.none, styles.NONE)
	Group.new("Title", colors.red, colors.none, styles.NONE)

	Group.new("Tag", colors.orange, colors.none, styles.NONE)
	Group.new("TODO", colors.blue, colors.none, styles.italic)

	Group.new("Underlined", colors.green, colors.none, styles.NONE)
	Group.new("Ignore", colors.none, colors.none, styles.NONE)

	Group.new("SpecialKey", colors.base00, colors.base02, styles.bold)
	Group.new("NonText", colors.base03, colors.NONE, styles.bold)
	Group.new("StatusLine", colors.base1, colors.base02, styles.reverse)
	Group.new("StatusLineNC", colors.base00, colors.base02, styles.reverse)
	Group.new("Visual", colors.base01, colors.base03, styles.reverse)
	Group.new("Directory", colors.blue, colors.none, styles.NONE)
	Group.new("ErrorMsg", colors.red, colors.none, styles.reverse)

	Group.new("IncSearch", colors.purple, colors.none, styles.standout)
	Group.new("Search", colors.purple, colors.none, styles.reverse)

	Group.new("MoreMsg", colors.blue, colors.none, styles.NONE)
	Group.new("ModeMsg", colors.blue, colors.none, styles.NONE)
	Group.new("Question", colors.cyan, colors.none, styles.bold)
	Group.new("VertSplit", colors.base00, colors.none, styles.NONE)
	Group.new("Title", colors.orange, colors.none, styles.bold)
	Group.new("VisualNOS", colors.none, colors.base02, styles.reverse)
	Group.new("WarningMsg", colors.red, colors.none, styles.NONE)
	Group.new("WildMenu", colors.base2, colors.base02, styles.reverse)
	Group.new("Folded", colors.base0, colors.base02, styles.bold, colors.base03)
	Group.new("FoldColumn", colors.base0, colors.base02, styles.NONE)

	Group.new("DiffAdd", colors.green, colors.base02, styles.bold, colors.green)
	Group.new("DiffChange", colors.yellow, colors.base02, styles.bold, colors.yellow)
	Group.new("DiffDelete", colors.red, colors.base02, styles.bold)
	Group.new("DiffText", colors.blue, colors.base02, styles.bold, colors.blue)

	Group.new("SignColumn", colors.base0, colors.none, styles.NONE)
	Group.new("Conceal", colors.blue, colors.none, styles.NONE)

	Group.new("SpellBad", colors.none, colors.none, styles.undercurl, colors.red)
	Group.new("SpellCap", colors.none, colors.none, styles.undercurl, colors.violet)
	Group.new("SpellRare", colors.none, colors.none, styles.undercurl, colors.cyan)
	Group.new("SpellLocal", colors.none, colors.none, styles.undercurl, colors.yellow)

	-- pum (popup menu)
	Group.new("Pmenu", colors.white2, colors.none, styles.none) -- popup menu normal item
	Group.new("PmenuSel", colors.white2, colors.selection, styles.NONE) -- selected item
	Group.new("PmenuSbar", colors.none, colors.bg2, styles.NONE)
	Group.new("PmenuThumb", colors.none, colors.selection, styles.NONE)

	-- be nice for this float border to be cyan if active
	Group.new("FloatBorder", colors.base02)

	Group.new("LineNr", colors.base01, colors.none, styles.NONE)
	Group.new("CursorLine", colors.none, colors.base02, styles.NONE, colors.base1)
	Group.new("Iluminate", colors.none, colors.base04, styles.italic)
	Group.new("IlluminatedWordText", colors.none, colors.base04, styles.italic)
	Group.new("IlluminatedWordRead", colors.none, colors.base04, styles.italic)
	Group.new("IlluminatedWordWrite", colors.none, colors.base04, styles.italic)
	Group.new("illuminatedWord", colors.none, colors.base04, styles.italic)
	Group.new("illuminatedCurWord", colors.none, colors.base04, styles.italic)
	Group.new("CursorLineNr", colors.none, colors.none, styles.NONE, colors.base1)
	Group.new("ColorColumn", colors.none, colors.base02, styles.NONE)
	Group.new("Cursor", colors.base03, colors.base0, styles.NONE)
	Group.link("lCursor", groups.Cursor)
	Group.link("TermCursor", groups.Cursor)
	Group.new("TermCursorNC", colors.base03, colors.base01)

	Group.new("MatchParen", colors.red, colors.base01, styles.bold)

	Group.new("GitSignsAddLn", colors.green)
	Group.new("GitSignsAddNr", colors.green)
	Group.new("GitSignsChangeLn", colors.yellow)
	Group.new("GitSignsChangeNr", colors.yellow)
	Group.new("GitSignsDeleteLn", colors.red)
	Group.new("GitSignsDeleteNr", colors.red)
	Group.link("GitSignsCurrentLineBlame", groups.Comment)

	-- vim highlighting
	Group.link("vimVar", groups.Identifier)
	Group.link("vimFunc", groups.Identifier)
	Group.link("vimUserFunc", groups.Identifier)
	Group.link("helpSpecial", groups.Special)
	Group.link("vimSet", groups.Normal)
	Group.link("vimSetEqual", groups.Normal)
	Group.new("vimCommentString", colors.violet)
	Group.new("vimCommand", colors.yellow)
	Group.new("vimCmdSep", colors.blue, colors.NONE, styles.bold)
	Group.new("helpExample", colors.base1)
	Group.new("helpOption", colors.cyan)
	Group.new("helpNote", colors.magenta)
	Group.new("helpVim", colors.magenta)
	Group.new("helpHyperTextJump", colors.blue, colors.NONE, styles.underline)
	Group.new("helpHyperTextEntry", colors.green)
	Group.new("vimIsCommand", colors.base00)
	Group.new("vimSynMtchOpt", colors.yellow)
	Group.new("vimSynType", colors.cyan)
	Group.new("vimHiLink", colors.blue)
	Group.new("vimGroup", colors.blue, colors.NONE, styles.underline + styles.bold)

	Group.new("gitcommitSummary", colors.green)
	Group.new("gitcommitComment", colors.base01, colors.NONE, styles.italic)
	Group.link("gitcommitUntracked", groups.gitcommitComment)
	Group.link("gitcommitDiscarded", groups.gitcommitComment)
	Group.new("gitcommitSelected", groups.gitcommitComment)
	Group.new("gitcommitUnmerged", colors.green, colors.NONE, styles.bold)
	Group.new("gitcommitOnBranch", colors.base01, colors.NONE, styles.bold)
	Group.new("gitcommitBranch", colors.magenta, colors.NONE, styles.bold)
	Group.link("gitcommitNoBranch", groups.gitcommitBranch)
	Group.new("gitcommitDiscardedType", colors.red)
	Group.new("gitcommitSelectedType", colors.green)
	Group.new("gitcommitHeader", colors.base01)
	Group.new("gitcommitUntrackedFile", colors.cyan)
	Group.new("gitcommitDiscardedFile", colors.red)
	Group.new("gitcommitSelectedFile", colors.green)
	Group.new("gitcommitUnmergedFile", colors.yellow)
	Group.new("gitcommitFile", colors.base0)
	Group.link("gitcommitDiscardedArrow", groups.gitCommitDiscardedFile)
	Group.link("gitcommitSelectedArrow", groups.gitCommitSelectedFile)
	Group.link("gitcommitUnmergedArrow", groups.gitCommitUnmergedFile)

	Group.link("diffAdded", groups.Statement)
	Group.link("diffLine", groups.Identifier)

	Group.new("NeomakeErrorSign", colors.orange)
	Group.new("NeomakeWarningSign", colors.yellow)
	Group.new("NeomakeMessageSign", colors.cyan)
	Group.new("NeomakeNeomakeInfoSign", colors.green)

	Group.new("CmpItemKind", colors.green, colors.none, styles.none)
	Group.new("CmpItemMenu", groups.NormalNC, colors.bg, styles.none)
	-- Group.new('CmpItemAbbr', colors.red, colors.bg, styles.none)
	-- Group.new('CmpItemAbbrMatch', colors.base0, colors.bg, styles.none)
	Group.new("CmpItemKindText", colors.purple, colors.none, styles.none)
	Group.new("CmpItemKindMethod", colors.green, colors.none, styles.none)
	Group.new("CmpItemKindFunction", colors.blue, colors.none, styles.none)
	Group.new("CmpItemKindConstructor", colors.orange, colors.none, styles.none)
	Group.new("CmpItemKindField", colors.yellow, colors.none, styles.none)
	Group.new("CmpItemKindVariable", colors.purple, colors.none, styles.none)
	Group.new("CmpitemKindClass", colors.yellow, colors.none, styles.none)
	Group.new("CmpItemKindInterface", colors.yellow, colors.none, styles.none)
	Group.new("CmpItemKindModule", colors.green, colors.none, styles.none)
	Group.new("CmpItemKindProperty", colors.green, colors.none, styles.none)
	Group.new("CmpItemKindUnit", colors.orange, colors.none, styles.none)
	Group.new("CmpItemKindValue", colors.cyan, colors.none, styles.none)
	Group.new("CmpItemKindEnum", colors.yellow, colors.none, styles.none)
	Group.new("CmpItemKindKeyword", colors.green, colors.none, styles.none)
	Group.new("CmpItemKindSnippet", colors.magenta, colors.none, styles.none)
	Group.new("CmpItemKindColor", colors.magenta, colors.none, styles.none)
	Group.new("CmpItemKindFile", colors.purple, colors.none, styles.none)
	Group.new("CmpItemKindReference", colors.violet, colors.none, styles.none)
	Group.new("CmpItemKindFolder", colors.purple, colors.none, styles.none)
	Group.new("CmpItemKindEnumMember", colors.cyan, colors.none, styles.none)
	Group.new("CmpItemKindConstant", colors.cyan, colors.none, styles.none)
	Group.new("CmpItemKindStruct", colors.yellow, colors.none, styles.none)
	Group.new("CmpItemKindEvent", colors.orange, colors.none, styles.none)
	Group.new("CmpItemKindOperator", colors.cyan, colors.none, styles.none)
	Group.new("CmpItemKindTypeParameter", colors.orange, colors.none, styles.none)

	Group.new("LspSagaCodeActionTitle", colors.green)
	Group.new("LspSagaBorderTitle", colors.yellow, colors.none, styles.bold)
	Group.new("LspSagaDiagnosticHeader", colors.yellow)
	Group.new("ProviderTruncateLine", colors.base02)
	Group.new("LspSagaShTruncateLine", groups.ProviderTruncateLine)
	Group.new("LspSagaDocTruncateLine", groups.ProviderTruncateLine)
	Group.new("LspSagaCodeActionTruncateLine", groups.ProviderTruncateLine)
	Group.new("LspSagaHoverBorder", colors.purple)
	Group.new("LspSagaRenameBorder", groups.LspSagaHoverBorder)
	Group.new("LSPSagaDiagnosticBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaSignatureHelpBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaCodeActionBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaLspFinderBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaFloatWinBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaSignatureHelpBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaDefPreviewBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaAutoPreviewBorder", groups.LspSagaHoverBorder)
	Group.new("LspFloatWinBorder", groups.LspSagaHoverBorder)
	Group.new("LspLinesDiagBorder", groups.LspSagaHoverBorder)
	Group.new("LspSagaFinderSelection", colors.green, colors.none, styles.bold)
	--Group.new('SagaShadow', colors.base02)

	Group.new("TelescopeMatching", colors.orange, groups.Special, groups.Special, groups.Special)
	Group.new("TelescopeBorder", colors.purple) -- float border not quite dark enough, maybe that needs to change?
	Group.new("TelescopePromptBorder", colors.purple) -- active border lighter for clarity
	Group.new("TelescopeTitle", groups.Normal) -- separate them from the border a little, but not make them pop
	Group.new("TelescopePromptPrefix", groups.Normal) -- default is groups.Identifier
	Group.link("TelescopeSelection", groups.CursorLine)
	Group.new("TelescopeSelectionCaret", colors.cyan)

	-- seblj/nvim-tabline
	Group.new("TabLineSeparatorActive", colors.cyan)
	Group.link("TabLineModifiedSeparatorActive", groups.TablineSeparatorActive)
	Group.new("TabLine", colors.base0, colors.base02, styles.NONE, colors.base0)
	Group.new("TabLineFill", colors.base0, colors.base02)
	Group.new("TabLineSel", colors.yellow, colors.bg)

	-- kevinhwang91/nvim-bqf
	Group.new("BqfPreviewBorder", colors.base01)
	Group.new("BqfSign", colors.cyan)

	-- Primeagen/harpoon
	Group.new("HarpoonBorder", colors.cyan)
	Group.new("HarpoonWindow", groups.Normal)
	-- Notify
	--- Border
	Group.new("NotifyERRORBorder", colors.purple)
	Group.new("NotifyWARNBorder", colors.magenta)
	Group.new("NotifyINFOBorder", colors.purple)
	Group.new("NotifyDEBUGBorder", colors.purple)
	Group.new("NotifyTRACEBorder", colors.purple)
	--- Icons
	Group.new("NotifyERRORIcon", colors.purple)
	Group.new("NotifyWARNIcon", colors.magenta)
	Group.new("NotifyINFOIcon", colors.purple)
	Group.new("NotifyDEBUGIcon", colors.purple)
	Group.new("NotifyTRACEIcon", colors.purple)
	--- Title
	Group.new("NotifyERRORTitle", colors.purple)
	Group.new("NotifyWARNTitle", colors.magenta)
	Group.new("NotifyINFOTitle", colors.purple)
	Group.new("NotifyDEBUGTitle", colors.purple)
	Group.new("NotifyTRACETitle", colors.purple)
	--- Body
	Group.new("NotifyERRORBody", colors.purple)
	Group.new("NotifyWARNBody", colors.magenta)
	Group.new("NotifyINFOBody", colors.purple)
	Group.new("NotifyDEBUGBody", colors.purple)
	Group.new("NotifyTRACEBody", colors.purple)
	Group.new("TSAttribute", colors.purple)
	Group.new("TSConstant", colors.orange)
	Group.new("TSKeywordFunction", colors.blue)
	Group.new("TSKeywordOperator", colors.red)

	Group.new("AlphaHeader", colors.purple)
	Group.new("AlphaButtons", colors.cyan)
	Group.new("AlphaShortcut", colors.cyan)
	Group.new("AlphaFooter", colors.purple)

	function M.translate(group)
		if fn.has("nvim-0.6.0") == 0 then
			return group
		end

		if not string.match(group, "^LspDiagnostics") then
			return group
		end

		local translated = group
		translated = string.gsub(translated, "^LspDiagnosticsDefault", "Diagnostic")
		translated = string.gsub(translated, "^LspDiagnostics", "Diagnostic")
		translated = string.gsub(translated, "Warning$", "Warn")
		translated = string.gsub(translated, "Information$", "Info")
		return translated
	end

	local lspColors = {
		Error = groups.Error,
		Warning = groups.Warning,
		Information = groups.Information,
		Hint = groups.Hint,
	}
	for _, lsp in pairs({ "Error", "Warning", "Information", "Hint" }) do
		local lspGroup = Group.new(M.translate("LspDiagnosticsDefault" .. lsp), lspColors[lsp])
		Group.link(M.translate("LspDiagnosticsVirtualText" .. lsp), lspGroup)
		Group.new(
			M.translate("LspDiagnosticsUnderline" .. lsp),
			colors.none,
			colors.none,
			styles.undercurl,
			lspColors[lsp]
		)
	end

	for _, name in pairs({ "LspReferenceText", "LspReferenceRead", "LspReferenceWrite" }) do
		Group.link(M.translate(name), groups.Iluminate)
	end

	return M
end

return M
