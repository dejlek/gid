module arrow.extension_data_type;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.chunked_array;
import arrow.data_type;
import arrow.extension_array;
import arrow.types;
import gid.global;
import gobject.object;

class ExtensionDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_extension_data_type_get_type != &gidSymbolNotFound ? garrow_extension_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  string getExtensionName()
  {
    char* _cretval;
    _cretval = garrow_extension_data_type_get_extension_name(cast(GArrowExtensionDataType*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  ExtensionArray wrapArray(Array storage)
  {
    GArrowExtensionArray* _cretval;
    _cretval = garrow_extension_data_type_wrap_array(cast(GArrowExtensionDataType*)cPtr, storage ? cast(GArrowArray*)storage.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!ExtensionArray(cast(GArrowExtensionArray*)_cretval, Yes.Take);
    return _retval;
  }

  ChunkedArray wrapChunkedArray(ChunkedArray storage)
  {
    GArrowChunkedArray* _cretval;
    _cretval = garrow_extension_data_type_wrap_chunked_array(cast(GArrowExtensionDataType*)cPtr, storage ? cast(GArrowChunkedArray*)storage.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!ChunkedArray(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }
}
