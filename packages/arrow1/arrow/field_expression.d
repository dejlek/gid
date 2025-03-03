module arrow.field_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.expression;
import arrow.types;
import gid.gid;
import glib.error;

class FieldExpression : arrow.expression.Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_field_expression_get_type != &gidSymbolNotFound ? garrow_field_expression_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string reference)
  {
    GArrowFieldExpression* _cretval;
    const(char)* _reference = reference.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_field_expression_new(_reference, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
