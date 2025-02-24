module gtk.bool_filter;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.filter;
import gtk.types;

/**
 * `GtkBoolFilter` evaluates a boolean `GtkExpression`
 * to determine whether to include items.
 */
class BoolFilter : Filter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_bool_filter_get_type != &gidSymbolNotFound ? gtk_bool_filter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new bool filter.
   * Params:
   *   expression = The expression to evaluate
   * Returns: a new `GtkBoolFilter`
   */
  this(Expression expression)
  {
    GtkBoolFilter* _cretval;
    _cretval = gtk_bool_filter_new(expression ? cast(GtkExpression*)expression.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the expression that the filter uses to evaluate if
   * an item should be filtered.
   * Returns: a `GtkExpression`
   */
  Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_bool_filter_get_expression(cast(GtkBoolFilter*)cPtr);
    auto _retval = _cretval ? new Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Returns whether the filter inverts the expression.
   * Returns: %TRUE if the filter inverts
   */
  bool getInvert()
  {
    bool _retval;
    _retval = gtk_bool_filter_get_invert(cast(GtkBoolFilter*)cPtr);
    return _retval;
  }

  /**
   * Sets the expression that the filter uses to check if items
   * should be filtered.
   * The expression must have a value type of %G_TYPE_BOOLEAN.
   * Params:
   *   expression = a `GtkExpression`
   */
  void setExpression(Expression expression)
  {
    gtk_bool_filter_set_expression(cast(GtkBoolFilter*)cPtr, expression ? cast(GtkExpression*)expression.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether the filter should invert the expression.
   * Params:
   *   invert = %TRUE to invert
   */
  void setInvert(bool invert)
  {
    gtk_bool_filter_set_invert(cast(GtkBoolFilter*)cPtr, invert);
  }
}
