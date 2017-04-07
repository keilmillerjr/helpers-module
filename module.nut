// Percentages of A Value
function percentage(per, val=100) {
	return (per / 100.0) * val.tofloat();
}

// Generate a pseudo-random integer between 0 and max
function randInteger(max) {
	return ((1.0 * rand() / RAND_MAX) * (max + 1)).tointeger();
}

// Generate a pseudo-random boolean
function randBool() {
	return randInteger(1) == 1;
}

// Convert 0/1 and Yes/No to Boolean
function toBool(x) {
	switch(typeof x) {
		case "bool":
			return x;
			break;
		case "integer":
			return x == 1;
			break;
		case "string":
			return x.tolower() == "yes";
			break;
		default:
			return false;
			break;
	}
}

// Seperate X and Y Resolutions From String
function splitRes(var, type, separator="x") {
	switch(type.tolower()) {
		case "width" || "w":
			return split(var, separator)[0].tointeger();
			break;
		case "height" || "h":
			return split(var, separator)[1].tointeger();
			break;
		default:
			try { log.send("Error passing " + var + " to splitRes function. " + type + " is not a valid type."); } catch(e) {}
			break;
	}
}

// Reverse X and Y Resolutions Within String
function reverseRes(var, separator="x") {
	return split(var, separator)[1].tointeger() + separator + split(var, separator)[0].tointeger();
}

// Is Layout In Vertical Orientation
function isLayoutVertical() {
	return (fe.layout.base_rotation + fe.layout.toggle_rotation) % 4 == (1 || 3);
}

// Is Layout Wide
function isWidescreen() {
	return fe.layout.width.tofloat() / fe.layout.height.tofloat() > 4.0 / 3.0;
}

// Shade
function shadeObject(obj, val) {
	val = percentage(val, 1);
	obj.red = 255*val;
	obj.green = 255*val;
	obj.blue = 255*val;
}

// Set Properties On An Object
function setProperties(target, properties) {
	foreach(key, value in properties) {
		try {
			target[key] = value;
		}
		catch(e) {
			try { log.send("Error setting property - " + key + "."); } catch(e) {}
		}
	}
}
