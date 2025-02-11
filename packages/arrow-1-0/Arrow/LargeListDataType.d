module Arrow.LargeListDataType;

import Arrow.DataType;
import Arrow.Field;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class LargeListDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_large_list_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Field field)
  {
    GArrowLargeListDataType* _cretval;
    _cretval = garrow_large_list_data_type_new(field ? cast(GArrowField*)field.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  Field getField()
  {
    GArrowField* _cretval;
    _cretval = garrow_large_list_data_type_get_field(cast(GArrowLargeListDataType*)cPtr);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }
}
