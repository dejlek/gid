module arrow.map_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.list_data_type;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class MapDataType : arrow.list_data_type.ListDataType
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_map_data_type_get_type != &gidSymbolNotFound ? garrow_map_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.data_type.DataType keyType, arrow.data_type.DataType itemType)
  {
    GArrowMapDataType* _cretval;
    _cretval = garrow_map_data_type_new(keyType ? cast(GArrowDataType*)keyType.cPtr(No.dup) : null, itemType ? cast(GArrowDataType*)itemType.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /** */
  arrow.data_type.DataType getItemType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_map_data_type_get_item_type(cast(GArrowMapDataType*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getKeyType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_map_data_type_get_key_type(cast(GArrowMapDataType*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.take);
    return _retval;
  }
}
