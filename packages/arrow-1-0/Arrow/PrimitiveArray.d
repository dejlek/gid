module Arrow.PrimitiveArray;

import Arrow.Array;
import Arrow.Buffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class PrimitiveArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_primitive_array_get_type();
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
