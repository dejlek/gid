module gtk.param_spec_expression;

import gid.gid;
import gobject.param_spec;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * A `GParamSpec` for properties holding a `GtkExpression`.
 */
class ParamSpecExpression : gobject.param_spec.ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ParamSpecExpression");

    super(cast(GParamSpec*)ptr, take);
  }
}
