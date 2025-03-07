module arrow.filter_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.expression;
import arrow.types;
import gid.gid;

/** */
class FilterNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_filter_node_options_get_type != &gidSymbolNotFound ? garrow_filter_node_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.expression.Expression expression)
  {
    GArrowFilterNodeOptions* _cretval;
    _cretval = garrow_filter_node_options_new(expression ? cast(GArrowExpression*)expression.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
