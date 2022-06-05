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
		//continue to the next iteration of no sprite and just -1 saved
		if (spr == -1) {
			--i; continue;	
		}
		switch spr[0] {
			case draw.color:
				draw_rectangle_color(128, 128, spr[1], spr[2], spr[0], spr[0], spr[0], spr[0], false);
			break;
			case draw.sprite:
				draw_sprite_ext(spr[1], 0, 128 + spr[3], 128 + spr[4], 1, 1, 0, spr[2], 1);
			break;
		}
		--i;
	}
}