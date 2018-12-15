// deactive spawn layer

for (var i = 1; i < 7; i++) {
	var layer_id_string = "Stage" + string(i);
	var layer_id = layer_get_id(layer_id_string);
	instance_deactivate_layer(layer_id);
}