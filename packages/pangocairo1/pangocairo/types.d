module pangocairo.types;

import cairo.context;
import gid.gid;
import pango.attr_shape;
import pangocairo.c.functions;
import pangocairo.c.types;


// Callbacks
alias ShapeRendererFunc = void delegate(cairo.context.Context cr, pango.attr_shape.AttrShape attr, bool doPath);
