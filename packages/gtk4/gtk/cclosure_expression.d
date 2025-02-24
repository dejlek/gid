module gtk.cclosure_expression;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
 * A variant of `GtkClosureExpression` using a C closure.
 */
class CClosureExpression : Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.CClosureExpression");

    super(cast(GtkExpression*)ptr, take);
  }
}
