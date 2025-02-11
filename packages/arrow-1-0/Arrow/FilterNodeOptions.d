module Arrow.FilterNodeOptions;

import Arrow.ExecuteNodeOptions;
import Arrow.Expression;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FilterNodeOptions : ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_filter_node_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Expression expression)
  {
    GArrowFilterNodeOptions* _cretval;
    _cretval = garrow_filter_node_options_new(expression ? cast(GArrowExpression*)expression.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
