module gtk.constant_expression;

import gid.global;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
 * A constant value in a `GtkExpression`.
 */
class ConstantExpression : Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ConstantExpression");

    super(cast(GtkExpression*)ptr, take);
  }

  /**
   * Creates an expression that always evaluates to the given `value`.
   * Params:
   *   value = a `GValue`
   * Returns: a new `GtkExpression`
   */
  static ConstantExpression newForValue(Value value)
  {
    GtkExpression* _cretval;
    _cretval = gtk_constant_expression_new_for_value(value ? cast(GValue*)value.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new ConstantExpression(cast(GtkExpression*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the value that a constant expression evaluates to.
   * Returns: the value
   */
  Value getValue()
  {
    const(GValue)* _cretval;
    _cretval = gtk_constant_expression_get_value(cast(GtkExpression*)cPtr);
    auto _retval = _cretval ? new Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
