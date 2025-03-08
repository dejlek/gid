module arrow.expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Expression : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_expression_get_type != &gidSymbolNotFound ? garrow_expression_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  bool equal(arrow.expression.Expression otherExpression)
  {
    bool _retval;
    _retval = garrow_expression_equal(cast(GArrowExpression*)cPtr, otherExpression ? cast(GArrowExpression*)otherExpression.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_expression_to_string(cast(GArrowExpression*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
