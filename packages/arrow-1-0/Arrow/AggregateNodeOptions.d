module Arrow.AggregateNodeOptions;

import Arrow.Aggregation;
import Arrow.ExecuteNodeOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class AggregateNodeOptions : ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_aggregate_node_options_get_type != &gidSymbolNotFound ? garrow_aggregate_node_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Aggregation[] aggregations, string[] keys)
  {
    GArrowAggregateNodeOptions* _cretval;
    auto _aggregations = gListFromD!(Aggregation)(aggregations);
    scope(exit) containerFree!(GList*, Aggregation, GidOwnership.None)(_aggregations);
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
