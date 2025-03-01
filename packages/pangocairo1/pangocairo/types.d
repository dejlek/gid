module pangocairo.types;

import cairo.context;
import gid.global;
import pango.attr_shape;
import pangocairo.c.functions;
import pangocairo.c.types;
import pangocairo.types;


// Callbacks
alias ShapeRendererFunc = void delegate(Context cr, AttrShape attr, bool doPath);
