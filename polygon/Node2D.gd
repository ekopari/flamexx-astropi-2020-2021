tool
extends Node2D

func _process(delta):
	var result = 0
	for p in get_children():
		if p is Polygon2D:
			result += polygonArea(p.polygon)
			p.color.a = 0.45
			p.scale = Vector2( 1 , 1 )
	$Label.text = "Rezultat: " + str(result)

func polygonArea(coords):
	var area = 0
	for i in range(len(coords)):
		#((x1 + x2) * (y1 - y2) + (x2 + x3) * (y2 - y3) + ... (xn + x1) * (yn - y1)) / 2
		area += (coords[i].x + coords[i - 1].x) * (coords[i].y - coords[i - 1].y)
	return abs(area / 2)

