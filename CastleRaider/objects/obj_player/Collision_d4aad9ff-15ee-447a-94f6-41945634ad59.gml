// get layer id
var layer_id = layer_get_id("Stage" + string(other.stage));

instance_activate_layer(layer_id);

// destroy trigger
instance_destroy(other);