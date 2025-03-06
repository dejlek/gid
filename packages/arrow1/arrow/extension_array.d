module arrow.extension_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ExtensionArray : arrow.array.Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_extension_array_get_type != &gidSymbolNotFound ? garrow_extension_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  arrow.array.Array getStorage()
  {
    GArrowArray* _cretval;
    _cretval = garrow_extension_array_get_storage(cast(GArrowExtensionArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
