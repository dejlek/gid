module arrow.array_sort_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class ArraySortOptions : arrow.function_options.FunctionOptions
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_array_sort_options_get_type != &gidSymbolNotFound ? garrow_array_sort_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.types.SortOrder order)
  {
    GArrowArraySortOptions* _cretval;
    _cretval = garrow_array_sort_options_new(order);
    this(_cretval, Yes.take);
  }

  alias equal = arrow.function_options.FunctionOptions.equal;

  /** */
  bool equal(arrow.array_sort_options.ArraySortOptions otherOptions)
  {
    bool _retval;
    _retval = garrow_array_sort_options_equal(cast(GArrowArraySortOptions*)cPtr, otherOptions ? cast(GArrowArraySortOptions*)otherOptions.cPtr(No.dup) : null);
    return _retval;
  }
}
