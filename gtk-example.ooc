import cairo/Cairo
import gtk/[Gtk, Widget, Window]

GdkDrawable: extern cover
gtk_widget_get_window: extern func (Widget) -> GdkDrawable*
gdk_cairo_create: extern func (GdkDrawable*) -> Context
gtk_widget_set_app_paintable: extern func (Widget, Bool)
exit: extern func

repaint: func (cr: Context) {
	/* code from test.ooc! */
	cr setSourceRGB(0, 0, 0)
	cr paint()

	cr setLineWidth(15)
	cr setSourceRGB(255, 0, 0)
	cr moveTo(0, -100)
	cr lineTo(100, 100)
	cr relLineTo(-200, 0)
	cr closePath()
	cr stroke()
}

onExpose: func (widget: Widget, event, userData: Pointer) -> Bool {
	/* expose event is sent when the widget (or parts of it) needs to be redrawn.
	   we repaint everything then.
	 */
	cr := gdk_cairo_create(gtk_widget_get_window(widget))
	repaint(cr)
	cr destroy()
	return true
}

main: func {
	win := Window new("Hai.")
	win setUSize(400, 200) .connect("delete_event", exit)
	gtk_widget_set_app_paintable(win, true)
	win connect("expose-event", onExpose)
	win showAll()

	Gtk main()
}


