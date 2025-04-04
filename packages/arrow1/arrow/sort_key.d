/// Module for [SortKey] class
module arrow.sort_key;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class SortKey : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sort_key_get_type != &gidSymbolNotFound ? garrow_sort_key_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override SortKey self()
  {
    return this;
  }

  /** */
  this(string target, arrow.types.SortOrder order)
  {
    GArrowSortKey* _cretval;
    const(char)* _target = target.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_sort_key_new(_target, order, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.sort_key.SortKey otherSortKey)
  {
    bool _retval;
    _retval = garrow_sort_key_equal(cast(GArrowSortKey*)cPtr, otherSortKey ? cast(GArrowSortKey*)otherSortKey.cPtr(No.Dup) : null);
    return _retval;
  }
}
