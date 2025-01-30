module Gtk.PropertyExpression;

import GObject.ParamSpec;
import GObject.Types;
import Gid.gid;
import Gtk.Expression;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GObject` property value in a `GtkExpression`.
 */
class PropertyExpression : Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.PropertyExpression");

    super(cast(GtkExpression*)ptr, take);
  }

  /**
   * Creates an expression that looks up a property.
   * The object to use is found by evaluating the `expression`,
   * or using the `this` argument when `expression` is `NULL`.
   * If the resulting object conforms to `this_type`, its property named
   * `property_name` will be queried. Otherwise, this expression's
   * evaluation will fail.
   * The given `this_type` must have a property with `property_name`.
   * Params:
   *   thisType = The type to expect for the this type
   *   expression = Expression to
   *     evaluate to get the object to query or `NULL` to
   *     query the `this` object
   *   propertyName = name of the property
   * Returns: a new `GtkExpression`
   */
  this(GType thisType, Expression expression, string propertyName)
  {
    GtkExpression* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = gtk_property_expression_new(thisType, expression ? cast(GtkExpression*)expression.cPtr(Yes.Dup) : null, _propertyName);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates an expression that looks up a property.
   * The object to use is found by evaluating the `expression`,
   * or using the `this` argument when `expression` is `NULL`.
   * If the resulting object conforms to `this_type`, its
   * property specified by `pspec` will be queried.
   * Otherwise, this expression's evaluation will fail.
   * Params:
   *   expression = Expression to
   *     evaluate to get the object to query or `NULL` to
   *     query the `this` object
   *   pspec = the `GParamSpec` for the property to query
   * Returns: a new `GtkExpression`
   */
  static PropertyExpression newForPspec(Expression expression, ParamSpec pspec)
  {
    GtkExpression* _cretval;
    _cretval = gtk_property_expression_new_for_pspec(expression ? cast(GtkExpression*)expression.cPtr(Yes.Dup) : null, pspec ? cast(GParamSpec*)pspec.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new PropertyExpression(cast(GtkExpression*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the expression specifying the object of
   * a property expression.
   * Returns: the object expression
   */
  Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_property_expression_get_expression(cast(GtkExpression*)cPtr);
    auto _retval = _cretval ? new Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the `GParamSpec` specifying the property of
   * a property expression.
   * Returns: the `GParamSpec` for the property
   */
  ParamSpec getPspec()
  {
    GParamSpec* _cretval;
    _cretval = gtk_property_expression_get_pspec(cast(GtkExpression*)cPtr);
    auto _retval = _cretval ? new ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }
}
