module gtk.object_expression;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    A [gobject.object.ObjectG] value in a [gtk.expression.Expression].
*/
class ObjectExpression : gtk.expression.Expression
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ObjectExpression");

    super(cast(GtkExpression*)ptr, take);
  }

  /**
      Creates an expression evaluating to the given `object` with a weak reference.
    
    Once the `object` is disposed, it will fail to evaluate.
    
    This expression is meant to break reference cycles.
    
    If you want to keep a reference to `object`, use [gtk.constant_expression.ConstantExpression.new_].
    Params:
      object =       object to watch
    Returns:     a new [gtk.expression.Expression]
  */
  this(gobject.object.ObjectG object)
  {
    GtkExpression* _cretval;
    _cretval = gtk_object_expression_new(object ? cast(ObjectC*)object.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /**
      Gets the object that the expression evaluates to.
    Returns:     the object, or `NULL`
  */
  gobject.object.ObjectG getObject()
  {
    ObjectC* _cretval;
    _cretval = gtk_object_expression_get_object(cast(GtkExpression*)cPtr);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, No.take);
    return _retval;
  }
}
