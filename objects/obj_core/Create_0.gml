enum draw {
	sprite,
	color,
}


//store filename
filename = -1;
//store directory
work_dir = -1;
//full yyp data
yyp_data = -1;
room_data = -1;
//amount of rooms in the project
room_amount = -1;
//room that has been opened
room_opened = -1;
loaded = false;
selection = 0;

//sprites (layers) that can be used to draw room
room_spr = [];;