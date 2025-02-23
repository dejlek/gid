module arrow.array_sort_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

class ArraySortOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_array_sort_options_get_type != &gidSymbolNotFound ? garrow_array_sort_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(SortOrder order)
  {
    GArrowArraySortOptions* _cretval;
    _cretval = garrow_array_sort_options_new(order);
    this(_cretval, Yes.Take);
  }

  alias equal = FunctionOptions.equal;

  bool equal(ArraySortOptions otherOptions)
  {
    bool _retval;
    _retval = garrow_array_sort_options_equal(cast(GArrowArraySortOptions*)cPtr, otherOptions ? cast(GArrowArraySortOptions*)otherOptions.cPtr(No.Dup) : null);
    return _retval;
  }
}
