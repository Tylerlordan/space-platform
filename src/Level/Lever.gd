extends Area2D

signal lever_pull_down()
signal lever_pull_up()

onready var animPlayer = $AnimationPlayer

var isPulled = false
var canPull = true

#Call when the lever is allow to interact again
func finished(_name):
	canPull = true

#When player interacted with lever
#it will check whether is can be pulled and which direction to pull
func interacted():
	if(canPull):
		if(isPulled):
			print("pull up")
			isPulled = false
			animPlayer.play("PullUp")
			emit_signal("lever_pull_up")
		else:
			print("pull down")
			isPulled = true
			animPlayer.play("PullDown")
			emit_signal("lever_pull_down")
		canPull = false
