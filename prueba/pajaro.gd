extends Node2D

@export var speed := 200.0
var speed_0 = speed
var flip_fact
var frame_count = 0
var direction

func _ready():
	position=Vector2(0.0,0.0)

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	$pajaroAnimacion.play("fly")
	if direction != Vector2(0,0):
		position += direction*delta*speed
		if direction.y < 0:
			$pajaroAnimacion.speed_scale = 2
		elif direction.y == 0:
			$pajaroAnimacion.speed_scale = 1
			
		if direction.x > 0:
			$pajaroAnimacion.flip_h = false
		elif direction.x < 0:
			$pajaroAnimacion.flip_h = true
		
		if abs(direction.x) == abs(direction.y):
			$pajaroAnimacion.rotation = 45
			if direction.x != direction.y:
				$pajaroAnimacion.rotation = -45
		else:
			if $pajaroAnimacion.flip_h == false:
				flip_fact = 1
			else:
				flip_fact = -1
			if direction.y == 0:
				$pajaroAnimacion.rotation = 0*flip_fact
			else:
				$pajaroAnimacion.rotation = 90*direction.y*flip_fact
		
		if direction.y > 0:
			$pajaroAnimacion.stop()
			$pajaroAnimacion.frame = 2
			if speed < 400:
				frame_count += 1
				speed = speed + 9.81*(frame_count/3)*sin(abs(deg_to_rad($pajaroAnimacion.rotation)))
			else:
				frame_count = 0
				speed = 400
		elif direction.y < 0:
			if speed > 50:
				frame_count += 1
				speed = speed + 9.81*(frame_count/3)*sin(deg_to_rad($pajaroAnimacion.rotation*flip_fact))
			else:
				frame_count = 0
				speed = 50
		else:
			if speed != speed_0:
				if speed > speed_0:
					speed += -0.025*speed
					if speed < speed_0:
						speed = speed_0
				if speed < speed_0:
					speed += 0.025*speed
					if speed > speed_0:
						speed = speed_0
		print(speed)
		print(frame_count)
	else:
		$pajaroAnimacion.rotation = 0
		$pajaroAnimacion.speed_scale = 1
		frame_count = 0
		if speed != speed_0:
			if speed > speed_0:
				speed += -0.025*speed
				if speed < speed_0:
					speed = speed_0
			if speed < speed_0:
				speed += 0.025*speed
				if speed > speed_0:
					speed = speed_0
