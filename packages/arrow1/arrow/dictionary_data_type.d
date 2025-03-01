module arrow.dictionary_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.global;
import gobject.object;

class DictionaryDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dictionary_data_type_get_type != &gidSymbolNotFound ? garrow_dictionary_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType indexDataType, DataType valueDataType, bool ordered)
  {
    GArrowDictionaryDataType* _cretval;
    _cretval = garrow_dictionary_data_type_new(indexDataType ? cast(GArrowDataType*)indexDataType.cPtr(No.Dup) : null, valueDataType ? cast(GArrowDataType*)valueDataType.cPtr(No.Dup) : null, ordered);
    this(_cretval, Yes.Take);
  }

  DataType getIndexDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_index_data_type(cast(GArrowDictionaryDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_value_data_type(cast(GArrowDictionaryDataType*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  bool isOrdered()
  {
    bool _retval;
    _retval = garrow_dictionary_data_type_is_ordered(cast(GArrowDictionaryDataType*)cPtr);
    return _retval;
  }
}
