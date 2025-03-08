module arrow.rank_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.sort_key;
import arrow.types;
import gid.gid;

/** */
class RankOptions : arrow.function_options.FunctionOptions
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_rank_options_get_type != &gidSymbolNotFound ? garrow_rank_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowRankOptions* _cretval;
    _cretval = garrow_rank_options_new();
    this(_cretval, Yes.take);
  }

  /**
      Add a sort key to be used.
    Params:
      sortKey =       The sort key to be added.
  */
  void addSortKey(arrow.sort_key.SortKey sortKey)
  {
    garrow_rank_options_add_sort_key(cast(GArrowRankOptions*)cPtr, sortKey ? cast(GArrowSortKey*)sortKey.cPtr(No.dup) : null);
  }

  alias equal = arrow.function_options.FunctionOptions.equal;

  /** */
  bool equal(arrow.rank_options.RankOptions otherOptions)
  {
    bool _retval;
    _retval = garrow_rank_options_equal(cast(GArrowRankOptions*)cPtr, otherOptions ? cast(GArrowRankOptions*)otherOptions.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  arrow.sort_key.SortKey[] getSortKeys()
  {
    GList* _cretval;
    _cretval = garrow_rank_options_get_sort_keys(cast(GArrowRankOptions*)cPtr);
    auto _retval = gListToD!(arrow.sort_key.SortKey, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Set sort keys to be used.
    Params:
      sortKeys =       The sort keys to be used.
  */
  void setSortKeys(arrow.sort_key.SortKey[] sortKeys)
  {
    auto _sortKeys = gListFromD!(arrow.sort_key.SortKey)(sortKeys);
    scope(exit) containerFree!(GList*, arrow.sort_key.SortKey, GidOwnership.None)(_sortKeys);
    garrow_rank_options_set_sort_keys(cast(GArrowRankOptions*)cPtr, _sortKeys);
  }
}
