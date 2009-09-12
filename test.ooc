import cairo.Cairo

main: func {
    w := 400
    h := 400

    surface := ImageSurface new(0, w, h) /* 0 = CAIRO_FORMAT_ARGB32 */
    cr := Context new(surface)

    cr setSourceRgb(0, 0, 0)
    cr paint()

    cr setLineWidth(15)
    cr setSourceRgb(255, 0, 0)
    cr moveTo(0, -100)
    cr lineTo(100, 100)
    cr relLineTo(-200, 0)
    cr closePath()
    cr stroke()

    surface writeToPng("test.png")
}
