-- Sgorblex's Conky config
-- ~/.config/conky/gotham.lua
--
-- originally designed by N00by4Ever at https://www.deviantart.com/n00by4ever/art/Gotham-Conky-config-Conky-1-10-548311990
-- and licensed with CCBY 3.0 (https://creativecommons.org/licenses/by/3.0/legalcode)
--
-- I made a couple tweaks and updated to Lua


conky.config = {
	use_xft = true,
	font = '123:size=8',
	xftalpha = 0.1,
	update_interval = 1,
	total_run_times = 0,

	own_window_type = 'override',
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
	own_window_colour = '#000000',
	own_window_argb_value = 0,
	minimum_width = 250,
	minimum_height = 5, 

	own_window = true,
	own_window_transparent = true,
	own_window_argb_visual = true,
	own_window_class = 'conky-gotham',

	double_buffer = true,
	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,
	default_color = 'white',
	default_shade_color = 'red',
	default_outline_color = 'green',

	alignment = 'bottom_left',
	gap_x = 100,
	gap_y = 100,
	no_buffers = true,
	uppercase = false,
	cpu_avg_samples = 2,
	net_avg_samples = 1,
	override_utf8_locale = true,
};

conky.text = [[
${voffset 10}${color EAEAEA}${font GE Inspira:pixelsize=120}${time %I:%M}${font}${voffset -84}${offset 10}${color FFA300}${font GE Inspira:pixelsize=42}${time %d} ${voffset -15}${color EAEAEA}${font GE Inspira:pixelsize=22}${time  %B} ${time %Y}${font}${voffset 24}${font GE Inspira:pixelsize=58}${offset -148}${time %A}${font}
${voffset 1}${offset 12}${font Ubuntu:pixelsize=12}${color FFA300}HD ${offset 9}$color${fs_free /} / ${fs_size /}${offset 30}${color FFA300}RAM ${offset 9}$color$mem / $memmax${offset 30}${color FFA300}CPU ${offset 9}$color${cpu cpu0}%





]];
