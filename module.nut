// Print Line
::printLine <- function(x) {
	print(x + "\n")
}
::printL <- printLine;

// Percentages of A Value
::percentage <- function(per, val=100) {
	return (per / 100.0) * val.tofloat();
}
::per <- percentage;

// Generate a pseudo-random integer between 0 and max
::randomInteger <- function(max) {
	return ((1.0 * rand() / RAND_MAX) * (max + 1)).tointeger();
}
::randInt <- randomInteger

// Generate a pseudo-random boolean
::randomBoolean <- function() {
	return randInteger(1) == 1;
}
::randBool <- randomBoolean;

// Convert 0/1 and Yes/No to Boolean
::toBoolean <- function(x) {
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
::toBool <- toBoolean;

// Seperate X and Y Resolutions From String
::splitResolution <- function(var, type, separator="x") {
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
::splitRes <- splitResolution;

// Reverse X and Y Resolutions Within String
::reverseResolution <- function(var, separator="x") {
	return split(var, separator)[1].tointeger() + separator + split(var, separator)[0].tointeger();
}
::reverseRes <- reverseResolution;

// Is Layout In Vertical Orientation
::isLayoutVertical <- function() {
	return (fe.layout.base_rotation + fe.layout.toggle_rotation) % 4 == (1 || 3);
}
::isLayoutVert <- isLayoutVertical;

// Is Layout Widescreen
::isWidescreen <- function() {
	return fe.layout.width.tofloat() / fe.layout.height.tofloat() > 4.0 / 3.0;
}

// Set Properties On An Object
::setProperties <- function(target, properties) {
	foreach(key, value in properties) {
		try {
			target[key] = value;
		}
		catch(e) {
			printL("Error setting property: " + key);
		}
	}
}
::setProps <- setProperties;

// Shade
::shadeObject <- function(obj, val) {
	val = percentage(val, 1);
	obj.red = 255*val;
	obj.green = 255*val;
	obj.blue = 255*val; 
}
::shadeObj <- shadeObject;
