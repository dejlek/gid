module Arrow.FixedSizeBinaryDataType;

import Arrow.FixedWidthDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FixedSizeBinaryDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_fixed_size_binary_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int byteWidth)
  {
    GArrowFixedSizeBinaryDataType* _cretval;
    _cretval = garrow_fixed_size_binary_data_type_new(byteWidth);
    this(_cretval, Yes.Take);
  }

  int getByteWidth()
  {
    int _retval;
    _retval = garrow_fixed_size_binary_data_type_get_byte_width(cast(GArrowFixedSizeBinaryDataType*)cPtr);
    return _retval;
  }
}
