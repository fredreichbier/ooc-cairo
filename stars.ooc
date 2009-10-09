import cairo/Cairo
include math, time

main: func (argc: Int, argv: String*) {
	
	"Welcome to the ooc-cairo stars generator!" println()
	
	w, h : Int
	
	if(argc < 2) {
		w = 800
		h = 800
		("Hint: you can actually call this program as " + (argv[0] as String) + " <width> <height>. Test it!") println()
	} else {
		w = argv[1] as String toInt()
		h = argv[2] as String toInt()
	}

    surface := ImageSurface new(0, w, h) /* 0 = CAIRO_FORMAT_ARGB32 */
    cr := Context new(surface)

    cr setSourceRGB(0, 0, 0)
    cr paint()
	
	srand(time(null))
	
	for(i in 0..20) {
		cr setLineWidth(rand() % 18 + 2)
		
		cr setSourceRGB(
			(rand() % 255) / 255.0 as Double,
			(rand() % 255) / 255.0 as Double,
			(rand() % 255) / 255.0 as Double,
		)
		
		cr drawStar(
			rand() % w,
			rand() % h,
			(rand() % 16) + 8,
			rand() % 120,
			(rand() % 50 + 50) * 0.01,
		)
	}

	fileName := "stars.png"
    surface writeToPng(fileName)
	("Done. Written to " + fileName) println()
	
}

Context: cover {
	
	drawStar: func (x, y, pikes: Int, radius, ratio: Float) {
		
		inside := true
		
		angle := 0.
		TWOPI := const 6.28
		
		moveTo(x + cos(angle) * radius, y + sin(angle) * radius)
		
		steps := pikes * 2
		while(angle < TWOPI) {
			angle += TWOPI / steps
			inside = !inside
			if (inside)
				lineTo(x + cos(angle) * radius, y + sin(angle) * radius)
			else
				lineTo(x + cos(angle) * radius * ratio, y + sin(angle) * radius * ratio)
		}
		
		closePath()
		stroke()
		
	}
	
}

cos: extern func (Double) -> Double
sin: extern func (Double) -> Double
time: extern func (Pointer) -> Int
srand: extern func (Int)
rand: extern func -> Int
