if (keyboard_check_pressed(vk_enter)) {
	if (loaded) {
		var _r = file_get_contents(work_dir + room_data[selection].roomId.path);
		room_opened = json_parse(_r);
		var j = 0; repeat (array_length(room_opened.layers)) {
			if variable_struct_exists(room_opened.layers[j], "spriteId") {
				if (room_opened.layers[j].spriteId == pointer_null) {
					room_spr[j] = [draw.color, room_opened.layers[j].colour, room_opened.roomSettings.Width, room_opened.roomSettings.Height];
				}
				else {
					var _spr = file_get_contents(work_dir + room_opened.layers[j].spriteId.path);
					var _spr_parsed = json_parse(_spr);		
					var _spr_path = filename_dir(work_dir + room_opened.layers[j].spriteId.path) + "\\";		
					var _spr_name = _spr_parsed.frames[0].compositeImage.FrameId.name;
		
					show_debug_message(_spr_path + _spr_name + ".png");
					var _spr_final = sprite_add(_spr_path + _spr_name + ".png", 1, false, false, 0, 0);
					room_spr[j] = [draw.sprite, _spr_final, room_opened.layers[j].colour, room_opened.layers[j].x, room_opened.layers[j].y];
				}
			}
			else room_spr[j] = -1;
			++j;
		}
		//display full sprite data
		show_debug_message(string(room_spr));
	}
	//open filename when pressing Enter and nothing loaded yet
	else filename = get_open_filename("*.yyp", "");
}

if (keyboard_check_pressed(vk_down)) selection++; //go down
else if (keyboard_check_pressed(vk_up)) selection--; //go yp

//load contents of a file only once
if (filename != -1 and !loaded) {
	//load content
	var _file_contents = file_get_contents(filename);
	loaded = true;
	//parse the contents into a struct
	yyp_data = json_parse(_file_contents);
	//data of the rooms in .yyp file
	room_data = yyp_data.RoomOrderNodes;
	//amount of rooms in the project
	room_amount = array_length(room_data);	
	//save working directory of the project
	work_dir = filename_dir(filename) + "\\";
}