module arrow.run_end_encoded_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.object;

class RunEndEncodedDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_run_end_encoded_data_type_get_type != &gidSymbolNotFound ? garrow_run_end_encoded_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType runEndDataType, DataType valueDataType)
  {
    GArrowRunEndEncodedDataType* _cretval;
    _cretval = garrow_run_end_encoded_data_type_new(runEndDataType ? cast(GArrowDataType*)runEndDataType.cPtr(No.Dup) : null, valueDataType ? cast(GArrowDataType*)valueDataType.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  DataType getRunEndDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_run_end_encoded_data_type_get_run_end_data_type(cast(GArrowRunEndEncodedDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_run_end_encoded_data_type_get_value_data_type(cast(GArrowRunEndEncodedDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }
}
