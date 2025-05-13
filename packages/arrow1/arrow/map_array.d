/// Module for [MapArray] class
module arrow.map_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.list_array;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class MapArray : arrow.list_array.ListArray
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_map_array_get_type != &gidSymbolNotFound ? garrow_map_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MapArray self()
  {
    return this;
  }

  /** */
  this(arrow.array.Array offsets, arrow.array.Array keys, arrow.array.Array items)
  {
    GArrowMapArray* _cretval;
    GError *_err;
    _cretval = garrow_map_array_new(offsets ? cast(GArrowArray*)offsets._cPtr(No.Dup) : null, keys ? cast(GArrowArray*)keys._cPtr(No.Dup) : null, items ? cast(GArrowArray*)items._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array getItems()
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_items(cast(GArrowMapArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getKeys()
  {
    GArrowArray* _cretval;
    _cretval = garrow_map_array_get_keys(cast(GArrowMapArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
