include cairo

use gdk, cairo

import Cairo
import gdk/Drawable

GdkContext: cover from cairo_t* extends Context {
	new: extern(gdk_cairo_create) static func ~gdk (target: Drawable) -> Context
}
