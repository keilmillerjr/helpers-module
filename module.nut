// Percentages of A Value
function percentage(percent, value) {
	return (percent / 100.0) * value.tofloat();
}

// Generate a pseudo-random integer between 0 and max
function randInteger(max) {
	return ((1.0 * rand() / RAND_MAX) * (max + 1)).tointeger();
}

// Generate a pseudo-random boolean
function randBool() {
	return randInteger(1) == 1 ? true : false;
}

// Convert 0/1 and Yes/No to Boolean
function toBool(x) {
	switch(typeof x) {
		case "bool":
			return x;
			break;
		case "integer":
			return x == 1 ? true : false;
			break;
		case "string":
			return x.tolower() == "yes" ? true : false;
			break;
		default:
			return false;
			break;
	}
}

// Seperate X and Y Resolutions
function splitRes(var, type) {
	switch(type.tolower()) {
		case "width" || "w":
			return split(var, "x")[0].tointeger();
			break;
		case "height" || "h":
			return split(var, "x")[1].tointeger();
			break;
		default:
			try { log.send("Error passing " + var + " to splitRes function. " + type + " is not a valid type."); } catch(e) {}
			break;
	}
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
