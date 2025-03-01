module arrow.primitive_array;

import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import gobject.object;

class PrimitiveArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_primitive_array_get_type != &gidSymbolNotFound ? garrow_primitive_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_primitive_array_get_buffer(cast(GArrowPrimitiveArray*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer getDataBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_primitive_array_get_data_buffer(cast(GArrowPrimitiveArray*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
