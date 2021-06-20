tool
extends MeshInstance

var time = 0


func _process(delta):
	time+=delta
	material_override.set("shader_param/iTime",time)
