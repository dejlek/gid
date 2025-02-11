module Arrow.MapDataType;

import Arrow.DataType;
import Arrow.ListDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class MapDataType : ListDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_map_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType keyType, DataType itemType)
  {
    GArrowMapDataType* _cretval;
    _cretval = garrow_map_data_type_new(keyType ? cast(GArrowDataType*)keyType.cPtr(No.Dup) : null, itemType ? cast(GArrowDataType*)itemType.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  DataType getItemType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_map_data_type_get_item_type(cast(GArrowMapDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  DataType getKeyType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_map_data_type_get_key_type(cast(GArrowMapDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }
}
