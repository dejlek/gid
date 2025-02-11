module Arrow.ListDataType;

import Arrow.DataType;
import Arrow.Field;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class ListDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_list_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Field field)
  {
    GArrowListDataType* _cretval;
    _cretval = garrow_list_data_type_new(field ? cast(GArrowField*)field.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  Field getField()
  {
    GArrowField* _cretval;
    _cretval = garrow_list_data_type_get_field(cast(GArrowListDataType*)cPtr);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  Field getValueField()
  {
    GArrowField* _cretval;
    _cretval = garrow_list_data_type_get_value_field(cast(GArrowListDataType*)cPtr);
    auto _retval = ObjectG.getDObject!Field(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }
}
