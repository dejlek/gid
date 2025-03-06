module arrow.integer_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_data_type;
import arrow.types;
import gid.gid;

/** */
class IntegerDataType : arrow.numeric_data_type.NumericDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_integer_data_type_get_type != &gidSymbolNotFound ? garrow_integer_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  bool isSigned()
  {
    bool _retval;
    _retval = garrow_integer_data_type_is_signed(cast(GArrowIntegerDataType*)cPtr);
    return _retval;
  }
}
