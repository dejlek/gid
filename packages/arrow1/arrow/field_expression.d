module arrow.field_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.expression;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class FieldExpression : arrow.expression.Expression
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_field_expression_get_type != &gidSymbolNotFound ? garrow_field_expression_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string reference)
  {
    GArrowFieldExpression* _cretval;
    const(char)* _reference = reference.toCString(No.alloc);
    GError *_err;
    _cretval = garrow_field_expression_new(_reference, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }
}
