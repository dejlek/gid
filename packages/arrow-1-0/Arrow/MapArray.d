module Arrow.MapArray;

import Arrow.Array;
import Arrow.ListArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class MapArray : ListArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_map_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Array offsets, Array keys, Array items)
  {
    GArrowMapArray* _cretval;
    GError *_err;
    _cretval = garrow_map_array_new(offsets ? cast(GArrowArray*)offsets.cPtr(No.Dup) : null, keys ? cast(GArrowArray*)keys.cPtr(No.Dup) : null, items ? cast(GArrowArray*)items.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  Array getItems()
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_items(cast(GArrowMapArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  Array getKeys()
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_keys(cast(GArrowMapArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
