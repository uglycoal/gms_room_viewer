if (keyboard_check_pressed(vk_enter)) {
	if (loaded) {
		var _r = file_get_contents(work_dir + room_data[selection].roomId.path);
		room_opened = json_parse(_r);
		var j = 0; repeat (array_length(room_opened.layers)) {
			if variable_struct_exists(room_opened.layers[j], "spriteId") {
				if (room_opened.layers[j].spriteId == pointer_null) {
					room_spr[j] = [room_opened.layers[j].colour, room_opened.roomSettings.Width, room_opened.roomSettings.Height];
				}
				else {
					var _spr = file_get_contents(work_dir + room_opened.layers[j].spriteId.path);
					var _spr_parsed = json_parse(_spr);		
					var _spr_path = filename_dir(work_dir + room_opened.layers[j].spriteId.path) + "\\";		
					var _spr_name = _spr_parsed.frames[0].compositeImage.FrameId.name;
		
					show_debug_message(_spr_path + _spr_name + ".png");
					room_spr[j] = sprite_add(_spr_path + _spr_name + ".png", 1, false, false, 0, 0);
				}
			}
			else room_spr[j] = -1;
			++j;
		}
		show_debug_message(string(room_spr));
	}
	else filename = get_open_filename("*.yyp", "");
}

if (keyboard_check_pressed(vk_down)) selection++;
else if (keyboard_check_pressed(vk_up)) selection--;

if (filename != -1 and !loaded) {
	var _file_contents = file_get_contents(filename);
	loaded = true;
	yyp_data = json_parse(_file_contents);
	room_data = yyp_data.RoomOrderNodes;
	room_amount = array_length(room_data);
	
	var len = string_length(filename);
	var i = len; repeat (len) {
		if string_char_at(filename,i) == "\\" {
			work_dir = string_delete(filename, i+1, len - i);
			break;
		}
		--i;
	}
	show_debug_message(string(yyp_data));
}