module Arrow.LiteralExpression;

import Arrow.Datum;
import Arrow.Expression;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LiteralExpression : Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_literal_expression_get_type != &gidSymbolNotFound ? garrow_literal_expression_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Datum datum)
  {
    GArrowLiteralExpression* _cretval;
    _cretval = garrow_literal_expression_new(datum ? cast(GArrowDatum*)datum.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
