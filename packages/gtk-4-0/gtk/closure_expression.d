module gtk.closure_expression;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
 * An expression using a custom `GClosure` to compute the value from
 * its parameters.
 */
class ClosureExpression : Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ClosureExpression");

    super(cast(GtkExpression*)ptr, take);
  }
}
