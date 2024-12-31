-- Key config
KEY_CUT = "|"
KEY_CYCLE_ACTION = "\\"
-- KEY_BOOKMARK_ADD = "i"
-- KEY_CHANNEL_INC = "="
-- KEY_CHANNEL_DEC = "-"
-- KEY_MAKE_CUTS = "0"

-- The list of channel names, you can choose whatever you want.
-- CHANNEL_NAMES[1] = "FUNNY"
-- CHANNEL_NAMES[2] = "COOL"

-- The default channel
CHANNEL = 1

-- The default action
ACTION = ACTIONS.ENCODE

-- The action to use when making cuts from a cut list
MAKE_CUT = ACTIONS.COPY

-- Delete a default action
ACTIONS.LIST = nil

-- Specify custom actions
ACTIONS.ENCODE = function(d)
	local args = {
		"ffmpeg",
		"-nostdin", "-y",
		"-loglevel", "error",
		"-i", d.inpath,
		"-ss", d.start_time,
		"-t", d.duration,
		"-pix_fmt", "yuv420p",
		"-crf", "16",
		"-preset", "superfast",
		utils.join_path(d.indir, d.infile_noext .. "-ENCODED-" .. d.start_time_hms .. d.ext)
	}
	mp.command_native_async({
		name = "subprocess",
		args = args,
		playback_only = false,
	}, function() print("Done") end)
end

ACTIONS.COPY = function(d)
	local args = {
		"ffmpeg",
		"-nostdin", "-y",
		"-loglevel", "error",
		"-i", d.inpath,
		"-ss", d.start_time,
		"-t", d.duration,
		"-pix_fmt", "yuv420p",
		"-crf", "16",
		"-preset", "superfast",
		utils.join_path(d.indir, d.infile_noext .. "-COPY-" .. d.start_time_hms .. d.ext)
	}
	mp.command_native_async({
		name = "subprocess",
		args = args,
		playback_only = false,
	}, function() print("Done") end)
end

-- The table that gets passed to an action will have the following properties:
-- inpath, indir, infile, infile_noext, ext
-- channel
-- start_time, end_time, duration
-- start_time_hms, end_time_hms, duration_hms
