module Arrow.ArraySortOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ArraySortOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_array_sort_options_get_type();
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
