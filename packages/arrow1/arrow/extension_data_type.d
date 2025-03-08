module arrow.extension_data_type;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.chunked_array;
import arrow.data_type;
import arrow.extension_array;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ExtensionDataType : arrow.data_type.DataType
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_extension_data_type_get_type != &gidSymbolNotFound ? garrow_extension_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  string getExtensionName()
  {
    char* _cretval;
    _cretval = garrow_extension_data_type_get_extension_name(cast(GArrowExtensionDataType*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  /** */
  arrow.extension_array.ExtensionArray wrapArray(arrow.array.Array storage)
  {
    GArrowExtensionArray* _cretval;
    _cretval = garrow_extension_data_type_wrap_array(cast(GArrowExtensionDataType*)cPtr, storage ? cast(GArrowArray*)storage.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.extension_array.ExtensionArray)(cast(GArrowExtensionArray*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray wrapChunkedArray(arrow.chunked_array.ChunkedArray storage)
  {
    GArrowChunkedArray* _cretval;
    _cretval = garrow_extension_data_type_wrap_chunked_array(cast(GArrowExtensionDataType*)cPtr, storage ? cast(GArrowChunkedArray*)storage.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.take);
    return _retval;
  }
}
