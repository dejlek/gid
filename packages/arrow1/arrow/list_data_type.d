/// Module for [ListDataType] class
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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_list_data_type_get_type != &gidSymbolNotFound ? garrow_list_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListDataType self()
  {
    return this;
  }

  /** */
  this(arrow.field.Field field)
  {
    GArrowListDataType* _cretval;
    _cretval = garrow_list_data_type_new(field ? cast(GArrowField*)field._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.field.Field getField()
  {
    GArrowField* _cretval;
    _cretval = garrow_list_data_type_get_field(cast(GArrowListDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.field.Field getValueField()
  {
    GArrowField* _cretval;
    _cretval = garrow_list_data_type_get_value_field(cast(GArrowListDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }
}
