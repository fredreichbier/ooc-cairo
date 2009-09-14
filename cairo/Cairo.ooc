include cairo

use cairo/cairo

cairo_user_data_key_t: extern cover

/* TODO: enums, and they have values */
Status: cover from cairo_status_t
Content: cover from cairo_content_t
SurfaceType: cover from cairo_surface_type_t
Operator: cover from cairo_operator_t
Antialias: cover from cairo_antialias_t
SubPixelOrder: cover from cairo_subpixel_order_t
FillRule: cover from cairo_fill_rule_t
LineCap: cover from cairo_line_cap_t
LineJoin: cover from cairo_line_join_t
FontSlant: cover from cairo_font_slant_t
FontWeight: cover from cairo_font_weight_t
TextClusterFlags: cover from cairo_text_cluster_flags_t
PatternType: cover from cairo_pattern_type_t
Extend: cover from cairo_extend_t
Filter: cover from cairo_filter_t
FontType: cover from cairo_font_type_t
HintStyle: cover from cairo_hint_style_t
HintMetrics: cover from cairo_hint_metrics_t
Format: cover from cairo_format_t

UserDataKey: cover from cairo_user_data_key_t* {
    new: static func -> This {
        gc_malloc(sizeof(cairo_user_data_key_t)) as UserDataKey
    }
}

Rectangle: cover from cairo_rectangle_t {
    x, y, width, height: extern Int
}

TextCluster: cover from cairo_text_cluster_t* {
    numBytes: extern(num_bytes) Int
    numGlyphs: extern(num_glyphs) Int
}

RectangleList: cover from cairo_rectangle_list_t* {
    status: extern Status
    rectangles: extern Rectangle*
    numRectangles: extern(num_rectangles) Int
}

TextExtents: cover from cairo_text_extents_t {
    xBearing: extern(x_bearing) Double
    yBearing: extern(y_bearing) Double
    width, height: extern Double
    xAdvance: extern(x_advance) Double
    yAdvance: extern(y_advance) Double
}

FontExtents: cover from cairo_font_extents_t* {
    ascent, descent, height: extern Double
    maxXAdvance: extern(max_x_advance) Double
    maxYAdvance: extern(max_y_advance) Double
}

Context: cover from cairo_t* {
    new: extern(cairo_create) static func (target: Surface) -> Context
    reference: extern(cairo_reference) func -> Context
    destroy: extern(cairo_destroy) func
    getReferenceCount: extern(cairo_get_reference_count) func -> UInt
    getUserData: extern(cairo_get_user_data) func (key: UserDataKey) -> Void*
    setUserData: extern(cairo_set_user_data) func (key: UserDataKey, userData: Void*, destroy: Func) -> Status
    save: extern(cairo_save) func
    restore: extern(cairo_restore) func
    pushGroup: extern(cairo_push_group) func
    pushGroupWithContent: extern(cairo_push_group_with_content) func (content: Content)
    popGroup: extern(cairo_pop_group) func -> Pattern
    popGroupToSource: extern(cairo_pop_group_to_source) func
    setOperator: extern(cairo_set_operator) func (op: Operator)
    setSource: extern(cairo_set_source) func (source: Pattern)
    setSourceRGB: extern(cairo_set_source_rgb) func (red: Double, green: Double, blue: Double)
    setSourceRGBa: extern(cairo_set_source_rgba) func (red: Double, green: Double, blue: Double, alpha: Double)
    setSourceSurface: extern(cairo_set_source_surface) func (surface: Surface, x: Double, y: Double)
    setTolerance: extern(cairo_set_tolerance) func (tolerance: Double)
    setAntialias: extern(cairo_set_antialias) func (antialias: Antialias)
    setFillRule: extern(cairo_set_fill_rule) func (fillRule: FillRule)
    setLineWidth: extern(cairo_set_line_width) func (width: Double)
    setLineCap: extern(cairo_set_line_cap) func (lineCap: LineCap)
    setLineJoin: extern(cairo_set_line_join) func (lineJoin: LineJoin)
    setDash: extern(cairo_set_dash) func (dashes: Double*, numDashes: Int, offset: Double)
    setMiterLimit: extern(cairo_set_miter_limit) func (limit: Double)
    translate: extern(cairo_translate) func (tx: Double, ty: Double)
    scale: extern(cairo_scale) func (sx: Double, sy: Double)
    rotate: extern(cairo_rotate) func (angle: Double)
    transform: extern(cairo_transform) func (matrix: Matrix)
    setMatrix: extern(cairo_set_matrix) func (matrix: Matrix)
    identityMatrix: extern(cairo_identity_matrix) func
    userToDevice: extern(cairo_user_to_device) func (x: Double*, y: Double*)
    userToDeviceDistance: extern(cairo_user_to_device_distance) func (dx: Double*, dy: Double*)
    deviceToUser: extern(cairo_device_to_user) func (x: Double*, y: Double*)
    deviceToUserDistance: extern(cairo_device_to_user_distance) func (dx: Double*, dy: Double*)
    newPath: extern(cairo_new_path) func
    moveTo: extern(cairo_move_to) func (x: Double, y: Double)
    newSubPath: extern(cairo_new_sub_path) func
    lineTo: extern(cairo_line_to) func (x: Double, y: Double)
    curveTo: extern(cairo_curve_to) func (x1: Double, y1: Double, x2: Double, y2: Double, x3: Double, y3: Double)
    arc: extern(cairo_arc) func (xc: Double, yc: Double, radius: Double, angle1: Double, angle2: Double)
    arcNegative: extern(cairo_arc_negative) func (xc: Double, yc: Double, radius: Double, angle1: Double, angle2: Double)
    relMoveTo: extern(cairo_rel_move_to) func (dx: Double, dy: Double)
    relLineTo: extern(cairo_rel_line_to) func (dx: Double, dy: Double)
    relCurveTo: extern(cairo_rel_curve_to) func (dx1: Double, dy1: Double, dx2: Double, dy2: Double, dx3: Double, dy3: Double)
    rectangle: extern(cairo_rectangle) func (x: Double, y: Double, width: Double, height: Double)
    closePath: extern(cairo_close_path) func
    paint: extern(cairo_paint) func
    paintWithAlpha: extern(cairo_paint_with_alpha) func (alpha: Double)
    mask: extern(cairo_mask) func (pattern: Pattern)
    maskSurface: extern(cairo_mask_surface) func (surface: Surface, surfaceX: Double, surfaceY: Double)
    stroke: extern(cairo_stroke) func
    strokePreserve: extern(cairo_stroke_preserve) func
    fill: extern(cairo_fill) func
    fillPreserve: extern(cairo_fill_preserve) func
    copyPage: extern(cairo_copy_page) func
    showPage: extern(cairo_show_page) func
    inStroke: extern(cairo_in_stroke) func (x: Double, y: Double) -> Bool
    inFill: extern(cairo_in_fill) func (x: Double, y: Double) -> Bool
    strokeExtents: extern(cairo_stroke_extents) func (x1: Double*, y1: Double*, x2: Double*, y2: Double*)
    fillExtents: extern(cairo_fill_extents) func (x1: Double*, y1: Double*, x2: Double*, y2: Double*)
    resetClip: extern(cairo_reset_clip) func
    clip: extern(cairo_clip) func
    clipPreserve: extern(cairo_clip_preserve) func
    clipExtents: extern(cairo_clip_extents) func (x1: Double*, y1: Double*, x2: Double*, y2: Double*)
    copyClipRectangleList: extern(cairo_copy_clip_rectangle_list) func -> RectangleList*
    selectFontFace: extern(cairo_select_font_face) func (family: Char*, slant: FontSlant, weight: FontWeight)
    setFontSize: extern(cairo_set_font_size) func (size: Double)
    setFontMatrix: extern(cairo_set_font_matrix) func (matrix: Matrix)
    getFontMatrix: extern(cairo_get_font_matrix) func (matrix: Matrix)
    setFontOptions: extern(cairo_set_font_options) func (options: FontOptions)
    getFontOptions: extern(cairo_get_font_options) func (options: FontOptions)
    setFontFace: extern(cairo_set_font_face) func (fontFace: FontFace)
    getFontFace: extern(cairo_get_font_face) func -> FontFace
    setScaledFont: extern(cairo_set_scaled_font) func (scaledFont: ScaledFont)
    getScaledFont: extern(cairo_get_scaled_font) func -> ScaledFont
    showText: extern(cairo_show_text) func (utf8: Char*)
    showGlyphs: extern(cairo_show_glyphs) func (glyphs: Glyph, numGlyphs: Int)
    showTextGlyphs: extern(cairo_show_text_glyphs) func (utf8: Char*, utf8Len: Int, glyphs: Glyph, numGlyphs: Int, clusters: TextCluster, numClusters: Int, clusterFlags: TextClusterFlags)
    textPath: extern(cairo_text_path) func (utf8: Char*)
    glyphPath: extern(cairo_glyph_path) func (glyphs: Glyph, numGlyphs: Int)
    textExtents: extern(cairo_text_extents) func (utf8: Char*, extents: TextExtents*)
    glyphExtents: extern(cairo_glyph_extents) func (glyphs: Glyph, numGlyphs: Int, extents: TextExtents*)
    fontExtents: extern(cairo_font_extents) func (extents: FontExtents)
    getOperator: extern(cairo_get_operator) func -> Operator
    getSource: extern(cairo_get_source) func -> Pattern
    getTolerance: extern(cairo_get_tolerance) func -> Double
    getAntialias: extern(cairo_get_antialias) func -> Antialias
    hasCurrentPoint: extern(cairo_has_current_point) func -> Bool
    getCurrentPoint: extern(cairo_get_current_point) func (x: Double*, y: Double*)
    getFillRule: extern(cairo_get_fill_rule) func -> FillRule
    getLineWidth: extern(cairo_get_line_width) func -> Double
    getLineCap: extern(cairo_get_line_cap) func -> LineCap
    getLineJoin: extern(cairo_get_line_join) func -> LineJoin
    getMiterLimit: extern(cairo_get_miter_limit) func -> Double
    getDashCount: extern(cairo_get_dash_count) func -> Int
    getDash: extern(cairo_get_dash) func (dashes: Double*, offset: Double*)
    getMatrix: extern(cairo_get_matrix) func (matrix: Matrix)
    getTarget: extern(cairo_get_target) func -> Surface
    getGroupTarget: extern(cairo_get_group_target) func -> Surface
    copyPath: extern(cairo_copy_path) func -> Path
    copyPathFlat: extern(cairo_copy_path_flat) func -> Path
    appendPath: extern(cairo_append_path) func (path: Path)
    status: extern(cairo_status) func -> Status
}

Path: cover from cairo_path_t* {
    extents: extern(cairo_path_extents) func (x1: Double*, y1: Double*, x2: Double*, y2: Double*)
    destroy: extern(cairo_path_destroy) func
}

Pattern: cover from cairo_pattern_t* {
    new: extern(cairo_pattern_create_rgb) static func ~rgb (red: Double, green: Double, blue: Double) -> Pattern
    new: extern(cairo_pattern_create_rgba) static func ~rgba (red: Double, green: Double, blue: Double, alpha: Double) -> Pattern
    new: extern(cairo_pattern_create_for_surface) static func ~forSurface (surface: Surface) -> Pattern
    new: extern(cairo_pattern_create_linear) static func ~linear (x0: Double, y0: Double, x1: Double, y1: Double) -> Pattern
    new: extern(cairo_pattern_create_radial) static func ~radial (cx0: Double, cy0: Double, radius0: Double, cx1: Double, cy1: Double, radius1: Double) -> Pattern
    reference: extern(cairo_pattern_reference) func -> Pattern
    destroy: extern(cairo_pattern_destroy) func
    getReferenceCount: extern(cairo_pattern_get_reference_count) func -> UInt
    status: extern(cairo_pattern_status) func -> Status
    getUserData: extern(cairo_pattern_get_user_data) func (key: UserDataKey) -> Void*
    setUserData: extern(cairo_pattern_set_user_data) func (key: UserDataKey, userData: Void*, destroy: Func) -> Status
    getType: extern(cairo_pattern_get_type) func -> PatternType
    addColorStopRGB: extern(cairo_pattern_add_color_stop_rgb) func (offset: Double, red: Double, green: Double, blue: Double)
    addColorStopRGBa: extern(cairo_pattern_add_color_stop_rgba) func (offset: Double, red: Double, green: Double, blue: Double, alpha: Double)
    setMatrix: extern(cairo_pattern_set_matrix) func (matrix: Matrix)
    getMatrix: extern(cairo_pattern_get_matrix) func (matrix: Matrix)
    setExtend: extern(cairo_pattern_set_extend) func (extend: Extend)
    getExtend: extern(cairo_pattern_get_extend) func -> Extend
    setFilter: extern(cairo_pattern_set_filter) func (filter: Filter)
    getFilter: extern(cairo_pattern_get_filter) func -> Filter
    getRGBa: extern(cairo_pattern_get_rgba) func (red: Double*, green: Double*, blue: Double*, alpha: Double*) -> Status
    getSurface: extern(cairo_pattern_get_surface) func (surface: Surface*) -> Status
    getColorStopRGBa: extern(cairo_pattern_get_color_stop_rgba) func (index: Int, offset: Double*, red: Double*, green: Double*, blue: Double*, alpha: Double*) -> Status
    getColorStopCount: extern(cairo_pattern_get_color_stop_count) func (count: Int*) -> Status
    getLinearPoints: extern(cairo_pattern_get_linear_points) func (x0: Double*, y0: Double*, x1: Double*, y1: Double*) -> Status
    getRadialCircles: extern(cairo_pattern_get_radial_circles) func (x0: Double*, y0: Double*, r0: Double*, x1: Double*, y1: Double*, r1: Double*) -> Status
}

FontFace: cover from cairo_font_face_t* {
    reference: extern(cairo_font_face_reference) func -> FontFace
    destroy: extern(cairo_font_face_destroy) func
    getReferenceCount: extern(cairo_font_face_get_reference_count) func -> UInt
    status: extern(cairo_font_face_status) func -> Status
    getType: extern(cairo_font_face_get_type) func -> FontType
    getUserData: extern(cairo_font_face_get_user_data) func (key: UserDataKey) -> Void*
    setUserData: extern(cairo_font_face_set_user_data) func (key: UserDataKey, userData: Void*, destroy: Func) -> Status
}

ScaledFont: cover from cairo_scaled_font_t* {
    new: extern(cairo_scaled_font_create) static func (fontFace: FontFace, fontMatrix: Matrix, ctm: Matrix, options: FontOptions) -> ScaledFont
    reference: extern(cairo_scaled_font_reference) func -> ScaledFont
    destroy: extern(cairo_scaled_font_destroy) func
    getReferenceCount: extern(cairo_scaled_font_get_reference_count) func -> UInt
    status: extern(cairo_scaled_font_status) func -> Status
    getType: extern(cairo_scaled_font_get_type) func -> FontType
    getUserData: extern(cairo_scaled_font_get_user_data) func (key: UserDataKey) -> Void*
    setUserData: extern(cairo_scaled_font_set_user_data) func (key: UserDataKey, userData: Void*, destroy: Func) -> Status
    extents: extern(cairo_scaled_font_extents) func (extents: FontExtents)
    textExtents: extern(cairo_scaled_font_text_extents) func (utf8: Char*, extents: TextExtents*)
    glyphExtents: extern(cairo_scaled_font_glyph_extents) func (glyphs: Glyph, numGlyphs: Int, extents: TextExtents*)
    textToGlyphs: extern(cairo_scaled_font_text_to_glyphs) func (x: Double, y: Double, utf8: Char*, utf8Len: Int, glyphs: Glyph*, numGlyphs: Int*, clusters: TextCluster*, numClusters: Int*, clusterFlags: TextClusterFlags*) -> Status
    getFontFace: extern(cairo_scaled_font_get_font_face) func -> FontFace
    getFontMatrix: extern(cairo_scaled_font_get_font_matrix) func (fontMatrix: Matrix)
    getCtm: extern(cairo_scaled_font_get_ctm) func (ctm: Matrix)
    getScaleMatrix: extern(cairo_scaled_font_get_scale_matrix) func (scaleMatrix: Matrix)
    getFontOptions: extern(cairo_scaled_font_get_font_options) func (options: FontOptions)
}

FontOptions: cover from cairo_font_options_t* {
    new: extern(cairo_font_options_create) static func -> FontOptions
    copy: extern(cairo_font_options_copy) func -> FontOptions
    destroy: extern(cairo_font_options_destroy) func
    status: extern(cairo_font_options_status) func -> Status
    merge: extern(cairo_font_options_merge) func (other: FontOptions)
    equal: extern(cairo_font_options_equal) func (other: FontOptions) -> Bool
    hash: extern(cairo_font_options_hash) func -> ULong
    setAntialias: extern(cairo_font_options_set_antialias) func (antialias: Antialias)
    getAntialias: extern(cairo_font_options_get_antialias) func -> Antialias
    setSubpixelOrder: extern(cairo_font_options_set_subpixel_order) func (subpixelOrder: SubPixelOrder)
    getSubpixelOrder: extern(cairo_font_options_get_subpixel_order) func -> SubPixelOrder
    setHintStyle: extern(cairo_font_options_set_hint_style) func (hintStyle: HintStyle)
    getHintStyle: extern(cairo_font_options_get_hint_style) func -> HintStyle
    setHintMetrics: extern(cairo_font_options_set_hint_metrics) func (hintMetrics: HintMetrics)
    getHintMetrics: extern(cairo_font_options_get_hint_metrics) func -> HintMetrics
}

Matrix: cover from cairo_matrix_t* {
    init: extern(cairo_matrix_init) func (xx: Double, yx: Double, xy: Double, yy: Double, x0: Double, y0: Double)
    initIdentity: extern(cairo_matrix_init_identity) func
    initTranslate: extern(cairo_matrix_init_translate) func (tx: Double, ty: Double)
    initScale: extern(cairo_matrix_init_scale) func (sx: Double, sy: Double)
    initRotate: extern(cairo_matrix_init_rotate) func (radians: Double)
    translate: extern(cairo_matrix_translate) func (tx: Double, ty: Double)
    scale: extern(cairo_matrix_scale) func (sx: Double, sy: Double)
    rotate: extern(cairo_matrix_rotate) func (radians: Double)
    invert: extern(cairo_matrix_invert) func -> Status
    multiply: extern(cairo_matrix_multiply) func (a: Matrix, b: Matrix)
    transformDistance: extern(cairo_matrix_transform_distance) func (dx: Double*, dy: Double*)
    transformPoint: extern(cairo_matrix_transform_point) func (x: Double*, y: Double*)
}

ToyFontFace: cover from cairo_font_face_t* extends FontFace {
    new: extern(cairo_toy_font_face_create) static func (family: Char*, slant: FontSlant, weight: FontWeight) -> FontFace
    getFamily: extern(cairo_toy_font_face_get_family) func -> Char*
    getSlant: extern(cairo_toy_font_face_get_slant) func -> FontSlant
    getWeight: extern(cairo_toy_font_face_get_weight) func -> FontWeight
}

UserFontFace: cover from cairo_font_face_t* extends FontFace {
    new: extern(cairo_user_font_face_create) static func -> FontFace
    setInitFunc: extern(cairo_user_font_face_set_init_func) func (initFunc: Func)
    setRenderGlyphFunc: extern(cairo_user_font_face_set_render_glyph_func) func (renderGlyphFunc: Func)
    setTextToGlyphsFunc: extern(cairo_user_font_face_set_text_to_glyphs_func) func (textToGlyphsFunc: Func)
    setUnicodeToGlyphFunc: extern(cairo_user_font_face_set_unicode_to_glyph_func) func (unicodeToGlyphFunc: Func)
    getInitFunc: extern(cairo_user_font_face_get_init_func) func -> Func
    getRenderGlyphFunc: extern(cairo_user_font_face_get_render_glyph_func) func -> Func
    getTextToGlyphsFunc: extern(cairo_user_font_face_get_text_to_glyphs_func) func -> Func
    getUnicodeToGlyphFunc: extern(cairo_user_font_face_get_unicode_to_glyph_func) func -> Func
}

Surface: cover from cairo_surface_t* {
    createSimilar: extern(cairo_surface_create_similar) func (content: Content, width: Int, height: Int) -> Surface
    reference: extern(cairo_surface_reference) func -> Surface
    finish: extern(cairo_surface_finish) func
    destroy: extern(cairo_surface_destroy) func
    getReferenceCount: extern(cairo_surface_get_reference_count) func -> UInt
    status: extern(cairo_surface_status) func -> Status
    getType: extern(cairo_surface_get_type) func -> SurfaceType
    getContent: extern(cairo_surface_get_content) func -> Content
    writeToPng: extern(cairo_surface_write_to_png) func (filename: Char*) -> Status
    writeToPngStream: extern(cairo_surface_write_to_png_stream) func (writeFunc: Func, closure: Void*) -> Status
    getUserData: extern(cairo_surface_get_user_data) func (key: UserDataKey) -> Void*
    setUserData: extern(cairo_surface_set_user_data) func (key: UserDataKey, userData: Void*, destroy: Func) -> Status
    getFontOptions: extern(cairo_surface_get_font_options) func (options: FontOptions)
    flush: extern(cairo_surface_flush) func
    markDirty: extern(cairo_surface_mark_dirty) func
    markDirtyRectangle: extern(cairo_surface_mark_dirty_rectangle) func (x: Int, y: Int, width: Int, height: Int)
    setDeviceOffset: extern(cairo_surface_set_device_offset) func (xOffset: Double, yOffset: Double)
    getDeviceOffset: extern(cairo_surface_get_device_offset) func (xOffset: Double*, yOffset: Double*)
    setFallbackResolution: extern(cairo_surface_set_fallback_resolution) func (xPixelsPerInch: Double, yPixelsPerInch: Double)
    getFallbackResolution: extern(cairo_surface_get_fallback_resolution) func (xPixelsPerInch: Double*, yPixelsPerInch: Double*)
    copyPage: extern(cairo_surface_copy_page) func
    showPage: extern(cairo_surface_show_page) func
    hasShowTextGlyphs: extern(cairo_surface_has_show_text_glyphs) func -> Bool
}

ImageSurface: cover from cairo_surface_t* extends Surface {
    new: extern(cairo_image_surface_create) static func (format: Format, width: Int, height: Int) -> Surface
    new: extern(cairo_image_surface_create_for_data) static func ~forData (data: UChar*, format: Format, width: Int, height: Int, stride: Int) -> Surface
    getData: extern(cairo_image_surface_get_data) func -> UChar*
    getFormat: extern(cairo_image_surface_get_format) func -> Format
    getWidth: extern(cairo_image_surface_get_width) func -> Int
    getHeight: extern(cairo_image_surface_get_height) func -> Int
    getStride: extern(cairo_image_surface_get_stride) func -> Int
    new: extern(cairo_image_surface_create_from_png) static func ~fromPng (filename: Char*) -> Surface
    new: extern(cairo_image_surface_create_from_png_stream) static func ~fromPngStream (readFunc: Func, closure: Void*) -> Surface
}

Glyph: cover from cairo_glyph_t*
