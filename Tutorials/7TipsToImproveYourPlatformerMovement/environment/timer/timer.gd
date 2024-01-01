class_name GameTimer extends Area2D

var done = false
static var startTime = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if done: return
	var t = Time.get_ticks_msec() - startTime;
	var minutes = int(t / 60 / 1000);
	var seconds = int(t / 1000) % 60;
	var miliseconds = int(t) % 1000;
	var time = ("%02d" % minutes) + (":%02d" % seconds) + (".%02d" % miliseconds);
	$Label.text = time;

func _on_body_entered(body):
	if body.has_meta("tag") and body.get_meta("tag") == "player":
		done = true
