module arrow.aggregate_node_options;

import arrow.aggregation;
import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class AggregateNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_aggregate_node_options_get_type != &gidSymbolNotFound ? garrow_aggregate_node_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override AggregateNodeOptions self()
  {
    return this;
  }

  /** */
  this(arrow.aggregation.Aggregation[] aggregations, string[] keys = null)
  {
    GArrowAggregateNodeOptions* _cretval;
    auto _aggregations = gListFromD!(arrow.aggregation.Aggregation)(aggregations);
    scope(exit) containerFree!(GList*, arrow.aggregation.Aggregation, GidOwnership.None)(_aggregations);
    size_t _nKeys;
    if (keys)
      _nKeys = cast(size_t)keys.length;

    char*[] _tmpkeys;
    foreach (s; keys)
      _tmpkeys ~= s.toCString(No.Alloc);
    const(char*)* _keys = _tmpkeys.ptr;

    GError *_err;
    _cretval = garrow_aggregate_node_options_new(_aggregations, _keys, _nKeys, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
