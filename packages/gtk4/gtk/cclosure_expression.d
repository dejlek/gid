/// Module for [CClosureExpression] class
module gtk.cclosure_expression;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    A variant of [gtk.closure_expression.ClosureExpression] using a C closure.
*/
class CClosureExpression : gtk.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.CClosureExpression");

    super(cast(GtkExpression*)ptr, take);
  }
}
