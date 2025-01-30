module Gtk.ObjectExpression;

import GObject.ObjectG;
import Gid.gid;
import Gtk.Expression;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GObject` value in a `GtkExpression`.
 */
class ObjectExpression : Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ObjectExpression");

    super(cast(GtkExpression*)ptr, take);
  }

  /**
   * Creates an expression evaluating to the given `object` with a weak reference.
   * Once the `object` is disposed, it will fail to evaluate.
   * This expression is meant to break reference cycles.
   * If you want to keep a reference to `object`, use [Gtk.ConstantExpression.new_].
   * Params:
   *   object = object to watch
   * Returns: a new `GtkExpression`
   */
  this(ObjectG object)
  {
    GtkExpression* _cretval;
    _cretval = gtk_object_expression_new(object ? cast(ObjectC*)object.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the object that the expression evaluates to.
   * Returns: the object, or `NULL`
   */
  ObjectG getObject()
  {
    ObjectC* _cretval;
    _cretval = gtk_object_expression_get_object(cast(GtkExpression*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectG(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }
}
