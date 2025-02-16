module Arrow.RunEndEncodedDataType;

import Arrow.DataType;
import Arrow.FixedWidthDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class RunEndEncodedDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
