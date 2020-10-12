/// @function draw_test_shadow(x, y, string)
/// @param {real} x x position
/// @param {real} y y position
/// @param {string} string the string to draw

function draw_text_shadow(_x, _y, _string){
	draw_set_colour(c_black);
	draw_text(_x + 1, _y + 1, _string);
	draw_set_colour(c_white);
	draw_text(_x, _y, _string);
}