module arrow.literal_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.expression;
import arrow.types;
import gid.gid;

/** */
class LiteralExpression : arrow.expression.Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_literal_expression_get_type != &gidSymbolNotFound ? garrow_literal_expression_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override LiteralExpression self()
  {
    return this;
  }

  /** */
  this(arrow.datum.Datum datum)
  {
    GArrowLiteralExpression* _cretval;
    _cretval = garrow_literal_expression_new(datum ? cast(GArrowDatum*)datum.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
