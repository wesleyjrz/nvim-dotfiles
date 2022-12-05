vim.g.bufferline = {
	animation = false,
	auto_hide = true, -- auto-hide tabs when there's a single buffer
	closable = false, -- enable close button
	clickable = true, -- enable clickable tabs (mouse support)
	icon_pinned = "",
	-- Hide help files
	exclude_ft = { "help" },
	-- Hide terminal buffer/tab
	exclude_name = { "bash", "zsh" }
}
