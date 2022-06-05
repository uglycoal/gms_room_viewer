if (loaded) {
	var i = 0; repeat (room_amount) {
		var pointer = selection == i ? "<-" : "";
		draw_text(32, 96 + (i * 16), string(room_data[i].roomId.name) + " " + pointer);
		++i;
	}
}
else draw_text(32,32,"Press Enter to load file.");

draw_text(32,48,"Loaded file: " + string(filename));
draw_text(32,64,"Working directory: " + string(work_dir));


var len = array_length(room_spr);
if (len > 0) {
	var i = len - 1; 
	repeat (len) {
		var spr = room_spr[i];
		if (is_array(spr)) {
			draw_rectangle_color(128, 128, spr[1], spr[2], spr[0], spr[0], spr[0], spr[0], false);
			--i;
			continue;
		}
		if (spr == -1) {
			--i;
			continue;
		}
		else draw_sprite(spr, 0, 128, 128);
		--i;
	}
}