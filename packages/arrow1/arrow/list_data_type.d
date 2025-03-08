module arrow.list_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.field;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ListDataType : arrow.data_type.DataType
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_list_data_type_get_type != &gidSymbolNotFound ? garrow_list_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.field.Field field)
  {
    GArrowListDataType* _cretval;
    _cretval = garrow_list_data_type_new(field ? cast(GArrowField*)field.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /** */
  arrow.field.Field getField()
  {
    GArrowField* _cretval;
    _cretval = garrow_list_data_type_get_field(cast(GArrowListDataType*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.field.Field getValueField()
  {
    GArrowField* _cretval;
    _cretval = garrow_list_data_type_get_value_field(cast(GArrowListDataType*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.take);
    return _retval;
  }
}
