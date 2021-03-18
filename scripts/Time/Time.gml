// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function formatSeconds(secs){
	var minute = floor(secs/60)
	secs = string(floor(secs mod 60))
	if (secs < 10)
		secs = "0" + string(secs)
	return string(minute) + ":" + secs
}
