function file_get_contents(file_name) {
	var s = file_name;
	var b = buffer_load(s);
	if (buffer_get_size(b) == 0) return "";
	var r = buffer_read(b, buffer_string);
	buffer_delete(b);
	return r;
}
function file_set_contents(file_name, val) {
	var s = file_name, v = val;
	var b = buffer_create(string_byte_length(v), buffer_grow, 1);
	buffer_write(b, buffer_text, v);
	buffer_save_ext(b, s, 0, buffer_tell(b));
}