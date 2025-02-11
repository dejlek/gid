module Arrow.SortKey;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class SortKey : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_sort_key_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string target, SortOrder order)
  {
    GArrowSortKey* _cretval;
    const(char)* _target = target.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_sort_key_new(_target, order, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  bool equal(SortKey otherSortKey)
  {
    bool _retval;
    _retval = garrow_sort_key_equal(cast(GArrowSortKey*)cPtr, otherSortKey ? cast(GArrowSortKey*)otherSortKey.cPtr(No.Dup) : null);
    return _retval;
  }
}
